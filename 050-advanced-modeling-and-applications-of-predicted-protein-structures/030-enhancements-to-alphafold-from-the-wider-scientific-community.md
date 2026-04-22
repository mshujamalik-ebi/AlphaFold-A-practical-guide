---
layout: default
title: 'Enhancements to AlphaFold2 from the wider scientific community'
---

# Enhancements to AlphaFold2 from the wider scientific community

**Ever since the open release of the AlphaFold2 source code, researchers have been extending AlphaFold2’s capabilities. In this way, researchers have made progress on problems that the original version of AlphaFold2 was not trained to solve.**

## **Predicting the structure of immune system proteins**

The original version of AlphaFold2 struggled to predict the structures of many immune system proteins, such as antibodies and T-cell receptors. Such molecules change rapidly in evolutionary time, making them especially difficult to analyse.

Research groups have adapted parts of AlphaFold2 and AlphaFold-Multimer to build antibody-specific versions of AlphaFold2. These software packages predict antibody structures far more accurately than AlphaFold2 ([Abanades et al., 2023](https://doi.org/10.1038/s42003-023-04927-7); [Peng et al., 2023](https://doi.org/10.1101/2023.04.20.537598); [Ruffolo et al., 2023](https://doi.org/10.1038/s41467-023-38063-x)).

Other groups have adapted AlphaFold2 to predict the structures of T-cell receptors. These are crucial components of the adaptive immune system that recognise and eliminate foreign pathogens and abnormal cells. They do so by binding to major histocompatibility complex (MHC) proteins on the outside of target cells. Researchers are now using modified versions of AlphaFold2 to predict the interactions of T-cell receptors and MHCs, and the complexes they form ([Abanades et al., 2023](https://doi.org/10.1038/s42003-023-04927-7); [Yin et al., 2023](https://doi.org/10.1093/nar/gkad356); [Mikhaylov et al., 2023](https://doi.org/10.1101/2023.03.06.531396); [Bradley, 2023](https://doi.org/10.7554/eLife.82813)).

## **Predicting the structures of transmembrane proteins**

AlphaFold2 is not aware of the membrane plane, so cannot reliably predict how protein structures are affected by interactions with membranes. However, researchers have found ways to tackle this problem.

Multiple teams have analysed structures from the AlphaFold Protein Structure Database and identified their  transmembrane domains. These transmembrane proteins have been gathered in databases, enabling researchers to visualise the likeliest positions of the membrane planes ([Dobson et al., 2022](https://doi.org/10.1093/nar/gkac928); [Pei et al., 2023](https://doi.org/10.1093/database/baad008); [Lomize et al., 2022](https://doi.org/10.1002/pro.4318)).

## **Streamlining predictions of protein-protein interaction**

AlphaFold-Multimer is able to predict protein-protein interactions, and to model the structures of larger complexes. However, the process requires considerable computing time and does not take into consideration prior experimental data.

To aid this process, researchers developed a Python package called [AlphaPulldown](https://www.embl-hamburg.de/AlphaPulldown/). The software reduces the computing time needed to screen for protein-protein interactions and for modelling of large complexes. It also improves protein-protein interaction predictions by adding other functionalities, including an analysis pipeline for evaluating predicted interfaces with multiple scores, an interactive Jupyter notebook that facilitates the simultaneous analysis of multiple models, and support for custom multimeric templates and crosslink-based modelling offered through the AlphaLink program ([Stahl et al., 2023](https://www.nature.com/articles/s41587-023-01704-z)).

## **Adding ligands and cofactors**

AlphaFold2 predicts protein structures with high accuracy. It may often predict a ligand- or ion-bound form of a protein, even in the absence of the actual ligand/ion. This is because AlphaFold2 saw such ligand- or ion-bound conformations of proteins during training and has learned these patterns.

However, the predicted structures do not include small molecules such as ligands and cofactors. These are often essential for protein function.

To address this need, researchers have developed a method called AlphaFill. It automatically ‘transplants’ missing ligands into the predicted structures. AlphaFill does this by comparing the sequence and structure of the target protein to other proteins, the structures of which have been determined by experiment – including ligands. This comparison enables AlphaFill to identify suitable ligands and place them correctly ([Hekkelman et al., 2022](https://doi.org/10.1038/s41592-022-01685-y)).

AlphaFill is available in two forms. First, it is online as a [database](https://alphafill.eu/): this contains the structures from the AlphaFold Protein Structure Database (AFDB), with transplanted ligands added wherever this was possible. Second, for those who need to add small molecules to custom structures using AlphaFill, the [web server](https://alphafill.eu/) can transplant missing ligands into predicted protein structures from AlphaFold2.
