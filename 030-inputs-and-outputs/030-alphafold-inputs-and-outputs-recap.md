---
layout: default
title: "AlphaFold2 inputs and outputs &#8211; Recap"
---

# AlphaFold2 inputs and outputs &#8211; Recap

**The only required input is the amino acid sequence of your protein of interest. However, you may also supply additional data to guide AlphaFold2’s structure prediction. AlphaFold2 will output the predicted structure of the protein, accompanied by confidence scores such as pLDDT and PAE.**

## **AlphaFold2 inputs**

To obtain a predicted structure for a protein, all you need to do is supply AlphaFold2 with its amino acid sequence. No other inputs are essential.

However, the quality of the predicted structure depends on the quality of the multiple sequence alignment (MSA), which is generated based on protein sequence data. MSAs built with the default mechanism usually work pretty well, but there could be exceptionally difficult cases (see section “[Strengths and limitations of AlphaFold2](https://www.ebi.ac.uk/training/online/courses/alphafold/an-introductory-guide-to-its-strengths-and-limitations/strengths-and-limitations-of-alphafold/)“).

If you feel that the MSA generated from your target protein sequence is not optimal, you may provide your own MSA, generated with your favourite tools (see section “[Customising AlphaFold2 structure predictions](https://www.ebi.ac.uk/training/online/courses/alphafold/advanced-modeling-and-applications-of-predicted-protein-structures/customising-alphafold-structure-predictions/)“).

Alternatively, you may guide the modelling by providing AlphaFold2 with template structures from protein(s) related to the target protein. For example, templates could be used to model a protein in a particular state (see section “[Customising AlphaFold2 structure predictions](https://www.ebi.ac.uk/training/online/courses/alphafold/advanced-modeling-and-applications-of-predicted-protein-structures/customising-alphafold-structure-predictions/)“).

The default parameters of AlphaFold2 tend to work well for the vast majority of proteins. However, for difficult cases it might be beneficial to adjust certain parameters. For instance, you might increase the number of recycles, or run several predictions starting from different random seeds (see section “[Customising AlphaFold2 structure predictions](https://www.ebi.ac.uk/training/online/courses/alphafold/advanced-modeling-and-applications-of-predicted-protein-structures/customising-alphafold-structure-predictions/)“).

Other software like ColabFold, which is built on top of AlphaFold2, introduces additional parameters to control AlphaFold2 (see section “[Predicting protein structures with ColabFold and AlphaFold Colab](https://www.ebi.ac.uk/training/online/courses/alphafold/accessing-and-predicting-protein-structures-with-alphafold/predicting-protein-structures-with-colabfold-and-alphafold-colab/)“).

## **AlphaFold2 outputs**

The main output of the AlphaFold2 neural network is the predicted structure of the protein or protein complex. It is saved in two standard formats: PDB and mmCIF.

The atomic coordinates are accompanied by pLDDT scores, which reflect local confidence of the prediction. pLDDT is also saved in the same PDB or mmCIF file, in the B-factors field. This means you can use molecular graphics programs like PyMOL to colour-code the predicted structure according to the pLDDT scores (See [ColabFold’s FAQ](https://github.com/sokrypton/ColabFold#faq) for the instructions).

AlphaFold2 also supplies PAE: an indication of its confidence in the packing and relative positions of domains. PAE is written out separately as a JSON file and can be visualised as a PAE plot.

For the modelling of multimers, two additional scores are supplied. pTM assesses the accuracy of the overall structure of the complex, while ipTM measures the precision of predictions of the interface between the subunits of the protein-protein complex. pTM and ipTM scores are written out in the log files and saved in the output JSON file ([please refer to the documentation](https://github.com/google-deepmind/alphafold/blob/main/README.md)).
