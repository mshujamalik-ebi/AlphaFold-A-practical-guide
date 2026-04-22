---
layout: default
title: 'Choosing how to access AlphaFold2'
---

# Choosing how to access AlphaFold2

**There are multiple ways to access AlphaFold2, from simply viewing a predicted protein structure online in the AlphaFold Protein Structure Database, to installing the source code and running custom predictions yourself. You should choose judiciously, based on your needs and the resources you have available.**

## **A common workflow with AlphaFold**2

* As an initial approach, you can check if the monomer of the protein of interest is already available in the AlphaFold Protein Structure Database. If it is, you should evaluate the proposed structure based on the confidence metrics.
* If it is not available, you can use a Colab such as [ColabFold](https://colab.research.google.com/github/sokrypton/ColabFold/blob/main/AlphaFold2.ipynb). This will give you a starting point for predicting your protein. You can predict the oligomeric form of the protein, and/or a protein-protein complex and get extended control over MSAs and templates. Additionally, [ColabFold batch](https://colab.research.google.com/github/sokrypton/ColabFold/blob/main/batch/AlphaFold2_batch.ipynb) is available to predict a few hundred protein structures.
* Lastly, if you plan to predict a sizeable number of structures, consider installing AlphaFold2 locally on a powerful workstation with a state-of-the-art GPU. You could even use a computational cluster, e.g. for protein-protein interaction screening. Please note that local installation might be challenging.

**Note: ​​**These research tools are all freely available for both academic and commercial use, under permissive open-source licences.

![](http://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2024/02/Workflow.png)

Figure 20. A typical workflow with AlphaFold, showing how to predict a protein structure. The workflow starts with the least computationally-intensive approach, only scaling up if that does not work.

The pros and cons of the three ways to access AlphaFold.

|  | PROS | CONS |
| --- | --- | --- |
| AlphaFold source code | * Full customisation of structure predictions. * Reproducibility. * Can perform structure predictions in bulk. * Gives a complete set of outputs, including MSA. | * Needs major computational resources (state-of-the-art GPU and 3 TB of disk space, ideally SSD). * Complexity of the installation procedures. * Only on Linux. |
| ColabFold or AlphaFold Colab | * No installation needed: uses a free cloud-based platform with access to computing resources. * Easy to use. * Gives full data on MSA used. | * Limited resources in the free mode. * Can upgrade to Colab Pro, but that requires a subscription. * AlphaFold Colab: Limited control on configurations. |
| AlphaFold Protein Structure Database (AFDB) | * Freely accessible. * Users can simply search for a protein sequence and download the corresponding predicted structure. * No waiting times. * Bulk download available. * Metadata available. | * Protein of interest might be missing. * Only monomers. * Only pre-computed structures are hosted. * Users cannot run their own structure predictions. * MSAs not available for structure predictions. |
