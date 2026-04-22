---
layout: default
title: 'Predicting protein structures with ColabFold and AlphaFold2 Colab'
---

# Predicting protein structures with ColabFold and AlphaFold2 Colab

**ColabFold and AlphaFold2 Colab allow you to predict protein structures without installing and running the full AlphaFold2 software. They are good options if you need a quick and easy way to get started with AlphaFold2, if you only need to predict a few structures, or if you don’t have access to a powerful computing resource.**

## **ColabFold and AlphaFold2 Colab: An overview and comparison**

ColabFold and AlphaFold2 Colab are online implementations of AlphaFold2. All operations take place in the cloud, so you can use the software without installing it on your own computer. Both systems are based on [Colab](https://colab.research.google.com/) (short for Colaboratory): a system that enables you to write and execute Python in your browser.

* The [AlphaFold2 Colab](https://colab.sandbox.google.com/github/deepmind/alphafold/blob/main/notebooks/AlphaFold.ipynb) is a simplified version of AlphaFold2. It only uses a portion of the [BFD](https://bfd.mmseqs.com/) (Big Fantastic Database) dataset and does not use homologous structures as templates. As a result, its accuracy is marginally lower than the full version of AlphaFold2. Users also cannot customise structure predictions by varying the parameters.
* [ColabFold](https://colab.sandbox.google.com/github/sokrypton/ColabFold/blob/main/AlphaFold2.ipynb) is a community implementation of a Colab for running AlphaFold2. It offers many more adjustable parameters than AlphaFold2 Colab, such as the depth of the MSA and the number of recycles. Furthermore, ColabFold uses quick MSA preparation via the [MMseqs2](https://github.com/soedinglab/mmseqs2) server. You can also use a custom MSA as input and supply templates ([Mirdita et al, 2022](https://doi.org/10.1038/s41592-022-01488-1)).

Therefore, we recommend using ColabFold because it is more powerful than AlphaFold2 Colab. Many studies that used AlphaFold2 modelling, published in top-tier journals, actually used ColabFold (e.g. [Healy et al., 2023](https://doi.org/10.1016/j.cell.2023.04.003)).

## **How to run ColabFold and AlphaFold2 Colab**

Both applications offer a simple interface: essentially, a form to fill out. For AlphaFold2 Colab, only the protein sequence is required. ColabFold also offers some additional options. The final step is to go to the “Runtime” menu and choose “Run all”.

![](https://ftp.ebi.ac.uk/pub/training/2024/On-demand/AlphaFold_Colab_and_ColabFold.gif)


Figure 24. You can predict protein structures online using ColabFold or AlphaFold2 Colab. These options do not require you to install the AlphaFold2 source code.

Running the Colabs and generating the prediction can take minutes to hours, depending on the length of your protein and on the type of GPU assigned to you by Colab.

For details on using ColabFold’s more advanced options, please refer to the original ColabFold paper ([Mirdita et al., 2022](https://doi.org/10.1038/s41592-022-01488-1)), ColabFold [documentation](https://github.com/sokrypton/ColabFold), and section “[Advanced modelling and applications of predicted protein structures](https://www.ebi.ac.uk/training/online/courses/alphafold/advanced-modeling-and-applications-of-predicted-protein-structures/)“.

Please note that advanced users with cutting-edge GPU hardware can set up a [local Colab](https://github.com/YoshitakaMo/localcolabfold). This enables you to run ColabFold, utilising your own GPU’s processing power. This could be an easier alternative to setting up a full open-source AlphaFold2 installation.

## **Limitations of ColabFold and AlphaFold2 Colab:**

In both cases, there are limits on the size of protein (measured by the number of amino acid residues) that can be predicted. The restrictions are primarily set by the quantity of RAM available on the free GPU provided by Colab. There is a maximum of 4,000 residues for predicting multimer models. The monomer model has a limit of 2,500 residues.

The Google Colab platform that runs both ColabFold and AlphaFold2 Colab provides users with a limited amount of computational resources for free. Colab notebooks on the free tier time out after a certain amount of time. However, you can get access to a [Google Colab Pro](https://colab.research.google.com/signup) for GPUs.
