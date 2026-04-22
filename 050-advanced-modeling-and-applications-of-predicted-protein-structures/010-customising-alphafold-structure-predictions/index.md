---
layout: default
title: 'Customising AlphaFold2 structure predictions'
---

# Customising AlphaFold2 structure predictions

**There are many ways to customise the protein structure predictions AlphaFold performs. They include varying the number of recycles, customising the MSA, and supplying a template structure. These kinds of customisation may improve AlphaFold2’s performance on challenging structures, such as proteins that have multiple conformations.**

## **Parameters available in ColabFold**

When using [ColabFold](https://colab.research.google.com/github/sokrypton/ColabFold/blob/main/AlphaFold2.ipynb), you can control the version of the AlphaFold2 model you use. Choose the appropriate model type for your predictions, such as “monomer” or one of the AlphaFold-Multimer versions. We recommend using AlphaFold2.3 for modelling multimers.

The most important parameters that can be changed are as follows:

* Number of recycles
* Depth of the multiple sequence alignment (MSA)
* Random seeds used to initialise predictions
* Whether to supply a template structure to guide AlphaFold’s prediction

Each parameter is explained in more detail in the following subsections.

ColabFold offers additional settings that you can explore. For further information, check the [instructions](https://colab.research.google.com/github/sokrypton/ColabFold/blob/main/AlphaFold2.ipynb#scrollTo=UGUBLzB3C6WN).

### **Recycling**

AlphaFold2 recycles its outputs to refine its structure predictions (see section “[A high-level overview](https://www.ebi.ac.uk/training/online/courses/alphafold/inputs-and-outputs/a-high-level-overview/)“).

You can increase the number of recycles so that structure predictions converge more closely. Adding more recycling steps (normally from 3 to 20) is an effective method for improving prediction quality.

Alternatively, you may decrease the number of recycles to speed up the structure prediction.

### **Optimising the multiple sequence alignment (MSA)**

The accuracy of an AlphaFold2 structure prediction relies on the quality of the multiple sequence alignment (MSA). Users have a number of options to optimise their MSA.

You can change the depth of the MSA, i.e. the number of sequences included. In ColabFold, the depth of the MSA is controlled by changing the ‘max\_msa’ parameter.

A deeper MSA with many hundreds or thousands of sequences will generally lead to a better prediction of protein structure. However, a shallow MSA with fewer than 100 sequences might be useful when you are providing a structural template (see “Using templates to guide structure predictions”, below).

Alternatively, you can provide a custom MSA to ColabFold. Any type of alignment tool can be used to generate the MSA.

Adjusting the MSA can be particularly useful for predicting the structures of different conformational states of a protein. For example, clustering an MSA by sequence similarity can elicit a range of conformations ([Wayment-Steele et al., 2023](https://doi.org/10.1038/s41586-023-06832-9)). Alternatively, reducing the depth of the MSA by stochastic subsampling can generate accurate models of multiple conformations ([del Alamo et al, 2022](https://doi.org/10.7554/eLife.75751)).

The optimal MSA settings will depend on the protein. Hence you may need to play around with these parameters to get the best output.

### **Using random seeds to increase prediction quality**

AlphaFold2 uses random seeds to initialise its structure predictions. You can control them by changing the ‘random\_seed’ parameter. In this way, you can sometimes guide AlphaFold2 towards a correct prediction.

From a computational standpoint, using different random seeds introduces variability in the structure prediction outcomes. By starting structure predictions from several different random points, AlphaFold2 can generate an increased diversity of structures.

Normally, high-confidence parts of the structure will converge to the same conformation regardless of the random seed used. However, low-confidence parts may vary substantially.

For example, when there are few to no sequences in the MSA, AlphaFold2 will struggle to predict the protein structure with high confidence. However, changing the random seeds will sometimes allow AlphaFold2 to predict the structure despite this hurdle (although this is not guaranteed). Adding more recycles can also help in this situation (see “Recycling”, above).

Furthermore, a shallow MSA combined with dropout and random seeds can drive AlphaFold2 to sample alternative conformations and/or different structure predictions.

### **Using templates to guide structure predictions**

You can provide structure models (preferably in the mmCIF format) as templates to guide AlphaFold2 to predict a protein in a specific state. The template acts as  a reference, nudging AlphaFold2’s prediction to resemble the structure you have provided.

You can provide a custom template. Alternatively, you can let ColabFold search for templates in the [PDB100](https://foldseek.steineggerlab.workers.dev/) database. This is a clustered version of PDB, created by searching PDB representative structures against the AlphaFold Protein Structure Database using Foldseek.

It is important to consider MSA depth when using templates. If the coevolutionary signal from the MSA is strong, AlphaFold2 tends to ignore template structures. On the other hand, too shallow an MSA may result in low-confidence structure predictions. Therefore, you must optimise the MSA depth value to strike the right balance, ensuring both that AlphaFold2 takes the template into account and that the MSA signal is strong enough to enable a confident structure prediction.

Here you can find a short example on how you can use ColabFold.

For additional protocols on using ColabFold for protein structure prediction, check the guide *“Easy and accurate protein structure prediction using ColabFold”* ([Kim et al., 2023](https://doi.org/10.21203/rs.3.pex-2490/v1))
