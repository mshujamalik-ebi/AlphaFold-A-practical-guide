---
layout: default
title: 'Outputs from ColabFold'
---

# Outputs from ColabFold

ColabFold generates PDB files containing the predicted 3D coordinates of the protein or protein complex. These can be analysed with standard molecular visualisation software packages, such as [PyMOL](https://pymol.org) or [Chimera](https://www.cgl.ucsf.edu/chimera/).

pLDDT values are stored in the B-factor field. This means you can use molecular graphics programs like PyMOL to colour-code the predicted structure according to the pLDDT scores (e.g. see [ColabFold’s FAQ](https://github.com/sokrypton/ColabFold#faq) for the instructions).

For monomer structures, the predictions are ranked by pLDDT, where ‘rank\_001’ represents the structure with the highest confidence. For protein complexes, the predictions are ranked by pTM (see section “[Evaluating AlphaFold2’s predicted structures using confidence scores](https://www.ebi.ac.uk/training/online/courses/alphafold/inputs-and-outputs/evaluating-alphafolds-predicted-structures-using-confidence-scores/)” for explanations of these confidence metrics).

ColabFold also provides a pLDDT plot (\_plddt.png). This shows the pLDDT score for each amino acid position. Meanwhile, the PAEs for all models are stored as one png file (\_PAE.png).

The MSA file (a3m format) contains the sequences used by ColabFold in the prediction.  This file can be inspected using your favourite alignment viewer, e.g. [JalView](https://www.jalview.org).

The MSA coverage and diversity can be examined by visualising the coverage plot  (\_coverage.png). This plot shows the number of sequences in the MSA and their identity to specific amino acid positions. This can provide insights into the sequence information used for the prediction.
