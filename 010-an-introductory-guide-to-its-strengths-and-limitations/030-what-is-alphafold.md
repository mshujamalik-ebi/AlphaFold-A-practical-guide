---
layout: default
title: What is AlphaFold?
---

# What is AlphaFold?

**AlphaFold is Google DeepMind’s contribution to the long-standing problem of protein structure prediction. It predicts the 3D structures of proteins with a high degree of accuracy and is now widely used by researchers.**

## **What AlphaFold is**

AlphaFold2 is a multicomponent artificial intelligence (AI) system that uses machine learning to predict a protein’s 3D structure based on its primary amino acid sequence.

Machine learning is a way for an AI to learn the patterns in a huge dataset. Once the AI has been trained on existing data, it can predict the properties of new examples, using the patterns it has identified.

AlphaFold2 is an example of an artificial neural network. It is a collection of simulated nodes, linked by connections that can be strengthened or weakened. Such networks can be adept at machine learning. Because AlphaFold’s network contains multiple layers of nodes, it is referred to as a “deep learning” algorithm. Please refer to the AlphaFold paper for the detailed description of the neural network architecture ([Jumper et al., 2021](https://doi.org/10.1038/s41586-021-03819-2)) or even check exact implementation in the [open source code](https://github.com/google-deepmind/alphafold).

AlphaFold is **not** a homology modelling tool: it can successfully operate without using any template structures and even predict previously unknown protein folds.

## **How AlphaFold2 solves the structure prediction problem**

The training data for AlphaFold2 came from the [Protein Data Bank](https://www.wwpdb.org/) (PDB): a free database containing all macromolecular structures that have ever been experimentally determined and publicly available . It currently has [over 215,000 entries](https://www.ebi.ac.uk/pdbe/). ([Learn more about the PDB](https://www.ebi.ac.uk/training/online/courses/pdbe-searching-pdb/what-is-pdbe/)).

Google DeepMind researchers used protein structures from the PDB, with their corresponding sequences, to train the AlphaFold2 neural network.

AlphaFold2 takes the amino acid sequence of a novel protein and aligns it to the sequences of other similar proteins. This identifies sections of the sequence that tend to change together in evolutionary time, and thus are likely to be interacting and thus physically close in the protein’s 3D structure. Within a few minutes (or tens of minutes for larger proteins or complexes), AlphaFold2 presents a prediction of the 3D structure of the sequence. AlphaFold2 may or may not use known protein structure(s) as templates (for details, see sections “[Validation and Impact](https://www.ebi.ac.uk/training/online/courses/alphafold/validation-and-impact/)” and “[Inputs and Outputs](https://www.ebi.ac.uk/training/online/courses/alphafold/inputs-and-outputs/)“).

Crucially, AlphaFold also provides confidence metrics, such as pLDDT, pTM and PAE. If it is not sure about some part of the structure, it will tell you this in the form of a confidence score, enabling critical interpretation (see [Section 3](https://www.ebi.ac.uk/training/online/courses/alphafold/inputs-and-outputs/evaluating-alphafolds-predicted-structures-using-confidence-scores/)).

![](https://ftp.ebi.ac.uk/pub/training/2024/On-demand/Diagram.gif)


Figure 3. From Sequence to Structure. AlphaFold2 takes the protein sequence and, in minutes, predicts their 3D structure

## **AlphaFold milestones**

In 2020, AlphaFold2 made headlines when it participated in, and won, the biennial Critical Assessment of Structure Prediction ([CASP14](https://predictioncenter.org/casp14/)). This experiment challenges participants to predict the structures of non-trivial protein targets, which have been experimentally resolved but are not yet publicly available. Based on the exceptionally high scores achieved by AlphaFold2, CASP organisers proclaimed that the protein structure prediction problem “[has been largely solved for single proteins](https://www.predictioncenter.org/casp14/doc/CASP14_press_release.html)”.

AlphaFold2 is available as an open-source program. It can be installed locally on a powerful workstation or accessed as a web-service via [Google Colab](https://colab.google/). You can use the freely available notebooks [AlphaFold](https://colab.research.google.com/github/deepmind/alphafold/blob/main/notebooks/AlphaFold.ipynb) or [ColabFold](https://colab.research.google.com/github/sokrypton/ColabFold/blob/main/AlphaFold2.ipynb#scrollTo=kOblAo-xetgx) (for details see section “[Accessing and predicting protein structures with AlphaFold](https://www.ebi.ac.uk/training/online/courses/alphafold/accessing-and-predicting-protein-structures-with-alphafold/)“). There is also a freely available [AlphaFold Protein Structure Database](https://alphafold.ebi.ac.uk/), a database of pre-calculated structures of the protein monomers for almost all (~200 million) [UniProt](https://www.uniprot.org/help/about) entries.

Since AlphaFold2’s release in 2021, it has seen rapid and widespread adoption. The paper describing the method had received over 15,000 citations by December 2023. Similarly, as of winter  2023, the AlphaFold Protein Structure Database (AFDB) had had 1.65 million unique visitors from more than 180 countries, and the archive had been downloaded over 22,000 times.

![](https://lh7-us.googleusercontent.com/vpgdaTiu9z_0059LYPg16aBlMlLDFWuQnJ5xbLKh3VUzAuya8CxYkvY4vckxEmF0xiA6IEAD9Xmug8e1n6QdrULALU90T9HM43uJ0Ofl5QcaJgG7ghWjIvv_QNkoOsmAJC1nm7ncuQ51bPTgvtZfAyA)

Figure 4. The number of scientific papers and preprints citing the key AlphaFold2 paper ([Jumper et al., 2021](https://doi.org/10.1038/s41586-021-03819-2)) every month since its publication in July 2021.



---

## Test your knowledge

Time to flex your AlphaFold muscles!
