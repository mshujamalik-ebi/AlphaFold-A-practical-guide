---
layout: default
title: 'Predicting protein structures using the AlphaFold2 open-source code'
---

# Predicting protein structures using the AlphaFold2 open-source code

**Installing the AlphaFold2 source code gives you total control over protein structure prediction. This is the most powerful and adaptable way to use AlphaFold2. However, the software places considerable demands on servers and requires a high degree of computer skill to install and run.**

## **Why should I install the AlphaFold2 source code?**

Installing AlphaFold2 on your own server or workstation, using the source code, gives you total control over the protein structure predictions that you run.

Running AlphaFold2 yourself may be the best option in several circumstances. These include: if your protein of interest is not in the AlphaFold Protein Structure Database (AFDB); if you want to predict an oligomer; if you want to predict a protein-protein complex; or if you need to manipulate the MSA and/or templates for a prediction. These functionalities are also available via Colabs, but using the source code gives you both full control and comprehensive outputs.

The AlphaFold2 source code is released under the Apache 2.0 licence.

To decide if installing AlphaFold2 is the right option for you, ask yourself the following two questions. Do you believe you can confidently follow the instructions from [README](https://github.com/google-deepmind/alphafold/blob/main/README.md) – or do you have an IT specialist who can do so? And do you have access to the necessary hardware? If the answer to both is yes, consider local AlphaFold2 installation. If not, we suggest sticking to [ColabFold](https://colab.research.google.com/github/sokrypton/ColabFold/blob/main/AlphaFold2.ipynb), which is enough for many practical applications.

## **Installing the AlphaFold2 source code**

All the code necessary to run AlphaFold2 can be found in the [official GitHub](https://github.com/google-deepmind/alphafold). This also includes model parameters, installation instructions, commands, and a record of changes in the [code versioning](https://github.com/google-deepmind/alphafold/releases). Please carefully review the [README](https://github.com/google-deepmind/alphafold/blob/main/README.md).

To install AlphaFold2, you will need a machine with Linux, up to 3 TB of disk space for genetic databases, and a modern NVIDIA GPU. While you can run AlphaFold2 without a GPU, it will be much slower. The maximum size of the modelled proteins or protein-protein complexes is determined only by the available GPU RAM; e.g. a single A100 GPU with 40Gb of RAM can handle complexes of up to ~5,000 residues.

Note that the code is regularly updated and new versions of the model are released.

If you don’t have access to such hardware, consider running AlphaFold2 on a virtual machine (VM) in the cloud. All major cloud providers are currently supporting AlphaFold2. Projects like [NMRBox](https://nmrbox.nmrhub.org/) provide free use of AlphaFold2 on their VMs for academic users. Furthermore, Google Cloud and Vertex.ai provide tailored, cost-effective solutions for running [AlphaFold in the cloud](https://cloud.google.com/blog/products/ai-machine-learning/running-alphafold-on-vertexai).

Additionally, AlphaFold2 requires local access to a large number of genetic databases, including [BFD](https://bfd.mmseqs.com/), [MGnify](https://www.ebi.ac.uk/metagenomics/), [PDB70](http://wwwuser.gwdg.de/~compbiol/data/hhsuite/databases/hhsuite_dbs/), [PDB](https://www.wwpdb.org/), [UniRef30 (FKA UniClust30)](https://uniclust.mmseqs.com/), and [UniRef90](https://www.uniprot.org/help/uniref). Similarly, AlphaFold-Multimer requires the [PDB SEQRES](https://www.wwpdb.org/documentation/file-format-content/format33/sect3.html#SEQRES) and [UniProt](https://www.uniprot.org/uniprot/) databases. However, if necessary, you can download a reduced version of the databases. Please follow the detailed installation instructions in the [README](https://github.com/google-deepmind/alphafold/blob/main/README.md), where a script is provided to automate download and setup of the databases.

**Note:** Your use of these databases is subject to their terms and conditions and/or licence provisions. You should check you can comply with any applicable restrictions or terms and conditions before use.

![](https://ftp.ebi.ac.uk/pub/training/2024/On-demand/source_code.gif)


Figure 25. The AlphaFold2 source code is freely available, so anyone can install it if they have a suitable system. All the necessary information is in README.

**Considerations for running your first structure predictions**

You can choose which AlphaFold2 model version to run. For protein-protein complexes, you can specify the AlphaFold-Multimer model.

To run a structure prediction, all you need to do is to provide the name of a file where the sequence of your protein, or sequences of the subunits in the case of a protein-protein complex, are kept in the FASTA format. You can then run AlphaFold2.

AlphaFold2 structure predictions typically take tens of minutes. A major contributor to the total time is the need to generate multiple sequence alignments (MSAs) and search templates: these processes can take tens of minutes. After this, the actual structure prediction may take seconds or minutes. For unrelaxed protein structures, structure predictions can typically take up to 5 seconds for a protein of 100 residues, and up to 20 minutes for a protein of 3,000 residues. The total time required to predict large complexes can be over an hour.

The workflow provided is for running one structure prediction at a time. There is also an option to run a series of structure predictions, by submitting a list of FASTA files. However, this is not practical for predicting structures of an entire proteome that includes thousands of proteins.

Bear in mind that AlphaFold2 uses random seeds to initialise each structure prediction. Normally, the structure prediction process for high-confidence regions of a protein will converge on the same solution, regardless of the seed used. However, in difficult cases, re-running your prediction with several different seeds may provide some diversity in the structure predictions, and ultimately improve your final structure prediction.

You also have the option to run your final structure through a relaxation process using [AMBER](https://github.com/openmm/openmmforcefields). Relaxation can help to resolve rare stereochemical violations and clashes. However, it typically takes several minutes to run. In most cases the direct output of the structure module is quite good even without relaxation.

AlphaFold2 outputs will be saved into a subdirectory that you specify. These outputs include the computed MSAs, unrelaxed structures, relaxed structures, ranked structures, raw model outputs, structure prediction metadata, and times taken for each step of the process.
