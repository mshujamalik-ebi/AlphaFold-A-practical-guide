---
layout: default
title: 'How to assess the quality of AlphaFold 3 predictions'
---

# How to assess the quality of AlphaFold 3 predictions

All predicted structures should be interpreted critically and in the light of the confidence scores. AlphaFold 3 uses the same confidence scores as AlphaFold 2, with minor modifications. Crucially, confidence scores are now calculated for tokens, rather than for amino acids as in AlphaFold 2. The use of tokens is essential for enabling AlphaFold 3 to predict heterogeneous complexes that include several types of molecules (see “[How does AlphaFold 3 work?](https://www.ebi.ac.uk/training/online/courses/alphafold/introducing-alphafold-3/how-does-alphafold-3-work/)”).

Because AlphaFold 3 is aimed at complexes, it is more important to consider those metrics that reflect the confidence of predicted interactions. These metrics include pTM, ipTM, pairwise ipTM and PAE for intersubunit contacts.

AlphaFold 3 confidence scores for polymers can be affected substantially by the inclusion (or removal) of non-polymer context, such as ions or stabilising ligands. If investigating something in a polymer-only setting (e.g. protein-protein interaction), it can be important to add non-polymer context where appropriate to improve confidence scores. AlphaFold 2 does not have this property, since it is trained and used with proteins only.

## **pLDDT scores in AlphaFold 3**

pLDDT is a per-atom estimate of AlphaFold 3’s confidence in a structure prediction.

It uses a 0-100 scale, where higher values indicate higher confidence. A value above 90 indicates high confidence; a value below 50 indicates the corresponding part of the predicted structure is probably wrong. This holds true for all types of molecules considered by AlphaFold 3.

![](http://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2025/06/Screenshot-2025-06-25-at-10.51.27.png)

As in AlphaFold 2, the pLDDT score is saved in the B-factors field of the mmCIF file that contains a predicted structure. This means you can use molecular graphics programs like PyMOL to colour-code the predicted structure according to the pLDDT scores.

The AlphaFold Server displays predicted structures coloured using pLDDT scores. This is consistent with the colour-coding used by the AlphaFold Database.

AlphaFold 3 provides pLDDT scores for multiple types of molecules, such as nucleotides and ligands. This contrasts with AlphaFold 2, which only supplies pLDDT scores for amino acids.

Notably, AlphaFold 3 calculates a pLDDT score for every individual atom in the structure. This differs from AlphaFold 2, which calculates pLDDT for each amino acid residue.

pLDDT aims to predict a modified LDDT score that only considers distances to polymers. For proteins, pLDDT is similar to the lDDT-Cα metric, but it has more granularity as it can vary per atom not just per residue. For ligand atoms, the modified LDDT only considers the positional errors between the ligand atom and polymers: it ignores other ligand atoms. For DNA and RNA, pLDDT uses a wider radius of 30 Å instead of the usual 15 Å.

## **PAE scores in AlphaFold 3**

Predicted aligned error (PAE) is a measure of AlphaFold 3’s confidence in the relative positions of two items within the predicted structure.

Higher PAE values indicate larger predicted errors and therefore lower confidence, just like in AlphaFold 2. This holds true for all the types of molecules AlphaFold 3 considers.

AlphaFold 3 calculates PAE for pairs of tokens, rather than pairs of amino acids as in AlphaFold 2. This enables the system to provide PAE scores for all the molecules and ions present in the structure.  
PAE is calculated slightly differently for different types of molecule. For proteins and nucleic acids, PAE is measured relative to frames constructed from the backbone atoms of those macromolecules. For small entities like ions, ligands and chemical modifications, a frame is constructed for each atom from its closest neighbours, using a molecule in a reference conformation.

If two tokens have a low PAE and belong to different entities, like a protein and a nucleic acid, it suggests there is an interaction between those parts of the entities.

If you are interested in predicting interactions between certain molecules, analysing the PAE between those molecules or their parts is helpful: low PAE values suggest interaction between at least some regions of the molecules, whereas high PAE values suggest no detected interaction. The PAE plot will help you visualise this.

## pTM and ipTM, per-chain scores and pairwise scores

AlphaFold 3 is aimed at modelling macromolecular complexes containing diverse components, so measures of its confidence in its prediction of the overall structure of the complex are especially important. Two values are provided: pTM and ipTM.

As in AlphaFold 2, pTM assesses the accuracy of the overall structure of the complex. pTM is now available for the individual chains, as well as for the whole complex.

Meanwhile, ipTM measures the precision of predictions of each single entity in the context of the whole macromolecular complex. ipTM is also available for every pair of entities within the complex: this is called pairwise ipTM.

The values of pTM and ipTM provided by AlphaFold 3 should be interpreted in the same way as those reported by AlphaFold 2. For instance, an ipTM score above 0.8 indicates a confidently predicted interaction. For more details, see “[Confidence scores in AlphaFold Multimer](https://www.ebi.ac.uk/training/online/courses/alphafold/inputs-and-outputs/evaluating-alphafolds-predicted-structures-using-confidence-scores/confidence-scores-in-alphafold-multimer/)”.

pTM is less useful for small structures and short chains. This is because the TM score is very strict for smaller molecules, so pTM assigns values below 0.05 when fewer than 20 tokens are involved. For these cases, PAE and/or pLDDT may be more indicative of prediction accuracy.

A further complication arises if a target macromolecule contains large disordered regions. As in AlphaFold 2, the disordered regions drive down both the pTM and ipTM scores. Therefore, the structure of a complex with large disordered sections could still be predicted correctly if pTM is below 0.5 and ipTM is below 0.6. In such cases, you should carefully examine the PAE plot. If the PAE between ordered parts of the macromolecules is low, this suggests possible interaction between those parts, regardless of low overall pTM and ipTM scores.

![](http://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2025/06/Figure9.png)

Figure 48. The Swi5 protein is mostly unstructured, except its confidently-predicted DNA-binding domain: this is highlighted by the blue oval on the structure representation and the blue rectangle on the PAE plot. Despite low overall pTM and ipTM scores (0.27 and 0.42 respectively), Swi5’s interaction with operator DNA is predicted confidently – as judged by the corresponding parts of the PAE plot, in the cyan rectangles.



---

Disclaimer: AlphaFold 3 is a research tool and its outputs have varying levels of confidence. The information provided in these modules and by AlphaFold Server is provided free of charge, strictly as-is and without representation or warranty of any kind. We are not responsible for the accuracy, reliability, availability, effectiveness, or correct use of this information or for any impact from ongoing use of such information. If you rely on any such information, you do so solely at your own risk. These modules, AlphaFold and its outputs are not intended for, have not been validated for, and are not approved for clinical use. You should not use any of this information for clinical purposes or rely on it for medical or other professional advice. Any content regarding those topics is provided for informational purposes only and is not a substitute for advice from a qualified professional.”
