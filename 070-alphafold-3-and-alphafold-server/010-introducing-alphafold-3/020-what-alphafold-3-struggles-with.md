---
layout: default
title: 'What AlphaFold 3 struggles with'
---

# What AlphaFold 3 struggles with

AlphaFold 3 can model chemically different entities like proteins, small molecules and metal ions. It therefore explores a much wider chemical space than just proteins. Nevertheless, AlphaFold 3 still has limitations.

A key limitation of protein structure prediction models is that they typically predict static structures as seen in the Protein Data Bank (PDB), and do not capture the dynamic behaviour of biomolecular systems in solution. AlphaFold 3 is no exception: it predicts a single structure for a particular sequence(s). It is possible to increase the variability of the predicted structures by modifying the MSA and using multiple seeds; however, there is no guarantee that this will produce additional structural states of the target molecules.

In some cases, the modelled conformational state may not be correct given the specified ligands and other inputs. For example, E3 ubiquitin ligases natively adopt an open conformation in an apo (ligand-free) state and are only observed in a closed conformation when in a holo state (ligand-bound). Nevertheless, AlphaFold 3 predicts the closed conformation for both holo and apo states ([Abramson et al, 2024](https://doi.org/10.1038/s41586-024-07487-w)).

![](http://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2025/06/Screenshot-2025-06-24-at-12.14.06-1024x468.png)

Figure 37: Cereblon conformations and AlphaFold 3 predictions. Ground-truth structures (grey) show cereblon in its open (apo, PDB: [8CVP](https://www.wwpdb.org/pdb?id=pdb_00008cvp); left) and closed (holo mezigdomide-bound, PDB: [8D7U](https://www.wwpdb.org/pdb?id=pdb_00008d7u); right) conformations. AlphaFold 3 predictions (blue) for both conformations are consistently in the closed state, with 10 overlaid samples for the apo prediction. The dashed lines highlight the distance between the N-terminal Lon protease-like and C-terminal thalidomide-binding domains.

There are still some targets that AlphaFold 3 struggles to model. One challenging class is orphan proteins, which lack known close sequence-based homologues, preventing AlphaFold 3 from building sufficiently deep MSAs. In such cases, one way to obtain the highest accuracy is to generate a large number of predictions and rank them. This is notably effective for antibody–antigen complexes: the top-ranked predictions keep improving as more model seeds are added, even at 1,000 seeds. However, this approach incurs computational costs.

The updated model architecture means that AlphaFold 3 sometimes produces categories of error that were not seen in AlphaFold 2. Crucially, AlphaFold 3 is a generative model, whereas AlphaFold 2 was non-generative. As a result, it sometimes predicts spurious structural order (hallucinations) in disordered regions. Hallucinated regions are usually marked as very low confidence, with pLDDT scores well below 50. However, they can lack the distinctive ribbon-like appearance that AlphaFold 2 produces in disordered regions, for example, forming alpha-helical structures instead. In the absence of this telltale appearance, low pLDDT is the main marker for hallucinatory parts of the structure. Note that hallucinations are quite rare (see Extended Data Fig. 1 of [Abramson et al., 2024](https://doi.org/10.1038/s41586-024-07487-w)).

![](http://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2025/06/Screenshot-2025-06-24-at-13.58.55.png)

Figure 38. AlphaFold 3 prediction of a nuclear pore complex . Shown are the ground-truth structure (left) of a nuclear pore complex (PDB: [7F60](https://www.wwpdb.org/pdb?id=pdb_00007f60)) with 1,854 unresolved residues, alongside predictions from AlphaFold-Multimer v.2.3 (middle) and AlphaFold 3 (right). While AlphaFold 3’s hallucinated regions in disordered areas are typically indicated by very low confidence scores, they can sometimes form ordered structures (e.g., alpha-helices) rather than the expected ribbon-like appearance characteristic of AlphaFold 2’s disordered region predictions.

AlphaFold 3 does not always respect chirality when predicting the conformations of small molecules. On the PoseBusters benchmark, it has a chirality violation rate of 4.4% ([Abramson et al., 2024](https://doi.org/10.1038/s41586-024-07487-w)).

AlphaFold 3 may occasionally predict overlapping (clashing) atoms. This sometimes manifests as extreme violations in proteins with two or more identical chains (homomers), in which entire chains are falsely predicted to overlap. However, this type of error is only rarely observed in large complexes with more than 2,000 tokens.
