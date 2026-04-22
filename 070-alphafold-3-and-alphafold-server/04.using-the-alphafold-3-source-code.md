---
layout: default
title: 'Using the AlphaFold 3 source code'
---

# Using the AlphaFold 3 source code

Installing AlphaFold 3 locally gives you total control over structure prediction. This is the most potent and adaptable way to use AlphaFold 3. However, the software requires access to the state-of-the-art hardware (i.e. GPUs with maximal RAM size) or a virtual machine and requires a high degree of computer skill to install and run.

## **Installing the AlphaFold 3 source code**

The AlphaFold 3 source code is available on the [official GitHub repository](https://github.com/google-deepmind/alphafold3). This repository provides an implementation of the AlphaFold 3 inference pipeline.

Model parameters must be obtained directly from Google, as detailed in the “[Obtaining model parameters](https://github.com/google-deepmind/alphafold3?tab=readme-ov-file#obtaining-model-parameters)” section on Github.

AlphaFold 3 requires a Linux environment; other operating systems are not supported. The full installation requires up to 1 TB of disk space, for genetic databases (SSD storage is strongly recommended). An NVIDIA GPU with compute capability 7.0 or higher is required. For larger protein structures, GPUs with higher memory capacity are recommended.

For reference, inputs with up to 5,120 tokens can fit on a single NVIDIA A100 80 GB or NVIDIA H100 80 GB. Numerical accuracy has been verified on both hardware types.

Alphafold 3, like AlphaFold 2, requires local access to large databases, including PDB, MGnify, UniProt, UniRef90, NT, RFam, RNACentral, and a modified version of BFD.

If you don’t have access to such hardware, one of the possibilities is to use a virtual machine (equipped according to these specifications) from any Cloud provider.

## **Considerations for initial structure predictions**

The data pipeline runtime (i.e. genetic sequence search and template search) can vary significantly depending on the size of the input and the number of homologous sequences found, as well as the available hardware (disk speed can influence genetic search speed in particular).

AlphaFold 3 can be run efficiently on a single NVIDIA A100 80 GB GPU. This configuration is well-suited for high-throughput predictions.

For better resource management, the pipeline can be split into:

* Data pipeline stage (CPU-intensive): This part performs genetic sequence search and template identification. Disk speed significantly impacts genetic search performance, so we recommend using an SSD drive.
* Model inference stage (GPU-intensive): This stage predicts the structure using the trained model.

If you would like to improve performance, it’s recommended to increase the disk speed (e.g. by leveraging a RAM-backed filesystem), or increase the available CPU cores and add more parallelisation.

For sequences with deep MSAs, RAM usage may exceed the recommended 64 GB.

Please carefully review the “[Installation and Running Your First Prediction](https://github.com/google-deepmind/alphafold3/blob/main/docs/installation.md)” for guidance on installation and running predictions. You can also run the pipeline in stages to optimise resource utilisation. See the note on [Performance](https://github.com/google-deepmind/alphafold3/blob/main/docs/performance.md).

## AlphaFold 3 input format

AlphaFold 3 introduces a flexible JSON-based input format that offers expanded customisation. This differs from the AlphaFold Server format and allows users to define complex biomolecular assemblies. Key features include:

* Protein, RNA, and DNA chains, with options for modified residues.
* Custom multiple sequence alignments (MSAs) for proteins and RNA.
* Structural templates for protein chains.
* Ligand specification using [Chemical Component Dictionary (CCD)](https://www.wwpdb.org/data/ccd) codes, SMILES strings, or user-defined entries in mmCIF format. GitHub AlphaFold 3 supports any custom ligands without restrictions.
* Covalent bond definitions between entities.
* Support for multiple random seeds to generate alternative structure predictions.

## Compatibility with AlphaFold Server JSON

AlphaFold 3 provides a converter in *run\_alphafold.py* that translates AlphaFold Server JSON files into the AlphaFold 3 format. For more information, see “[AlphaFold 3 Input](https://github.com/google-deepmind/alphafold3/blob/main/docs/input.md#alphafold-3-input)”. Key points include:

* The converter assigns unique sequence identifiers where required.
* At least one random seed is required for AlphaFold 3. If a converted JSON lacks this, the converter will assign one automatically.
* AlphaFold Server treats ions and ligands separately, AlphaFold 3 treats ions as ligands.
* Note that glycans specified in AlphaFold Server JSONs are not supported in conversion.

## Special considerations

Start with smaller proteins or well-characterized targets to familiarise yourself with the workflow and parameters.

Run single predictions by providing a JSON file path or multiple predictions by providing a directory path.

Your institution may already have central AF3 installation, so then you shall refer to the local guides on how to run it. Otherwise you may want to contact your system administrators for assistance with AF3 installation and consider making a central installation for the local users.

For more detailed guidance, please refer to the AlphaFold 3 Input [README](https://github.com/google-deepmind/alphafold3/blob/main/docs/input.md).
