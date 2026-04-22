---
layout: default
title: 'How does AlphaFold 3 work?'
---

# How does AlphaFold 3 work?

AlphaFold 3 is built on similar general principles as AlphaFold 2 (for more on AlphaFold 2, see section [AlphaFold 2: A high-level overview](https://www.ebi.ac.uk/training/online/courses/alphafold/inputs-and-outputs/a-high-level-overview/)).

Many practical details remain the same, notably the use of multiple sequence alignments (MSAs) as the main input of the neural network. Furthermore, the overall architecture of AlphaFold 3 retains a familiar structure, that of AlphaFold 2, where a large trunk processes a pairwise representation of the chemical complex, which is then used by a structure module to generate explicit atomic positions.

However, despite these foundational similarities, AlphaFold 3’s architecture has substantially improved over AlphaFold 2. The new architecture accommodates more general chemical structures and improves the data efficiency of learning.

![](http://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2025/06/AFS-Education-Figure-2-240828-r01-1024x265.png)

Figure 35. The architecture of AlphaFold 3. Rectangles represent processing modules, while arrows show the flow of data. Yellow, input data; blue, abstract network activations; green, output data. The coloured spheres represent physical atom coordinates.

For instance, to reduce the amount of MSA processing, AlphaFold 3 replaces AlphaFold 2’s Evoformer with a new Pairformer module that has a smaller and simpler MSA embedding block. Some of AlphaFold 3’s advancements, notably its improved performance predictions of antigen-antibody complexes, are directly related to its reduced dependence on the MSA signal. Nevertheless, for protein structure prediction, AlphaFold 3 still makes heavy use of co-evolutionary data from the MSA.

Crucially, AlphaFold 3 predicts the coordinates of individual atoms within a complex. This is distinct from AlphaFold 2, which predicted the positions of amino acid residues and their side chains. The new approach gives AlphaFold 3 the computational flexibility to tackle different types of molecules.

### Tokenisation

A further change in AlphaFold 3, compared to AlphaFold 2, is how the system subdivides a complex. Both divide the complex of interest into “tokens”. In AlphaFold 2, tokens directly correspond to amino acids, reflecting the system’s strict focus on protein structures. In contrast, AlphaFold 3 is designed to effectively model chemically different molecules, ranging from ions and small molecule ligands to macromolecules made of hundreds of amino acids or nucleotides. A one-token-per-atom approach for the whole structure, including proteins and nucleic acids, would offer the maximum flexibility: however, memory constraints necessitate a compromise.

Thus, AlphaFold 3’s tokenisation strategy balances the need for flexibility required for small molecules with computational practicality. Hence, a token may correspond to:

* One standard amino acid in the protein chain
* One standard nucleotide in the nucleic acid chain
* One atom of a ligand
* One atom of an ion
* One atom of a chemically-modified amino acid residue or nucleotide. In order to predict the structure of a chemically-modified amino acid residue or nucleotide, AlphaFold 3 will tokenise the entire residue/nucleotide as atoms. In other words, these are treated more like ligands than standard amino acids or nucleotides.

To understand this, consider a structure made of 100 amino acid residues and a ligand containing 20 atoms. AlphaFold 3 will represent this structure using 100 + 20 = 120 tokens. This is important because confidence metrics like PAE (see subsection “[Interpreting results from AlphaFold Server](https://www.ebi.ac.uk/training/online/courses/alphafold/interpreting-results-from-alphafold-server/)“) are now calculated for tokens rather than amino acids.

![](http://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2025/06/tokens.png)

Figure 36. Illustrating tokenisation. Here, three amino acid residues take three tokens to model; three nucleotides take three tokens as well, and one citric acid takes 13 tokens, for 13 non-hydrogen atoms in this ligand.

### Diffusion

AlphaFold 3 predicts raw atom coordinates using a diffusion module, making it a “generative” ML model. Generative models create new data similar to the examples they learn from: in the case of AlphaFold 3, structures from the Protein Data Bank. This contrasts with non-generative models like AlphaFold 2, which identify patterns in the existing data.

Diffusion is a standard technique in machine learning. First, a high-information dataset is distorted by varying levels of random noise; subsequently, the neural network learns to restore it to the original data. The system uses a conditioning description for each example that should be restored. For example, when generating images, a typical conditioning might be a text description of the final image. During training, the network learns to generate plausible data to fit any given conditioning by incrementally stepping from pure noise to the final output.

In AlphaFold 3, the diffusion module was trained to receive “noised” atomic coordinates and predict the correct coordinates. The conditioning information is the sequence information for the target molecule or complex.

For more details on the internal mechanics of AlphaFold 3, see the Supplementary Material to the AlphaFold 3 paper ([Abramson et al., 2024](https://doi.org/10.1038/s41586-024-07487-w)).

## Overview of AlphaFold 3 outputs

AlphaFold 3 outputs the predicted structure of a protein or complex, returning the coordinates of all atoms in the mmCIF format. By default, AlphaFold 3 produces five predicted structures from a single seed. These are generated by sampling the diffusion process five times.

As with AlphaFold 2, AlphaFold 3 supplies multiple confidence metrics to help you critically assess its predictions:

* **Predicted LDDT (pLDDT):** predicted atomic coordinates are accompanied by pLDDT scores. These reflect AlphaFold 3’s local confidence in the prediction of the position of that particular atom.
* **Predicted Aligned Error (PAE) scores and a PAE plot:** an indication of AlphaFold’s confidence in the packing and relative positions of domains, molecular chains such as proteins and DNA, and other entities like ligands and ions.
* **Predicted TM (pTM) score**: a single-value metric reflecting the accuracy of the overall predicted structure.
* **Interface-predicted TM (ipTM) score:** measures the accuracy of predictions of one component of the complex relative to the other components of the complex.
* **Per chain pTM and per-chain pair ipTM:** confidence in individual chains or pairs of chains.

---
