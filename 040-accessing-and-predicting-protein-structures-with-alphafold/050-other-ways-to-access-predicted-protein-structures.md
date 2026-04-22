---
layout: default
title: 'Other ways to access predicted protein structures'
---

# Other ways to access predicted protein structures

**There are many different ways to access protein structures predicted by AlphaFold2. The 3D-Beacons Network provides standardised macromolecular structures from a host of providers, including AlphaFold2. Furthermore, AlphaFold2 and its database have been integrated into many pieces of software used to work with predicted structures.**

## **The 3D-Beacons Network**

The[3D-Beacons Network](https://www.ebi.ac.uk/pdbe/pdbe-kb/3dbeacons/) is an open collaboration of macromolecular structure model providers.

It aims to provide standardised model coordinates and meta-information from all contributing data resources on a unified platform. It also provides unified programmatic access to experimentally-determined and predicted structure models. The 3D-Beacons Network brings together providers including: [PDBe](https://www.ebi.ac.uk/pdbe/), [AFDB](https://alphafold.ebi.ac.uk/), [Protein Ensemble Database](https://proteinensemble.org/), [Isoform.io](https://www.isoform.io/), [SWISS-MODEL](https://swissmodel.expasy.org/), [AlphaFill](https://alphafill.eu/), [SASBDB](https://www.sasbdb.org/) and more.

All data on the 3D-Beacons Network is freely available for both academic and commercial use, under the Creative Commons Attribution 4.0 (CC-BY 4.0) licence.

![](https://ftp.ebi.ac.uk/pub/training/2024/On-demand/3D_Beacons.gif)


Figure 26. The 3D-Beacons Network is an open collaboration of macromolecular structure providers. You can compare experimentally determined and predicted structures of macromolecules from a range of providers, including AlphaFold Database.

## **Software packages supporting access to AlphaFold**2

AlphaFold2 and the AlphaFold Protein Structure Database (AFDB) have been integrated into specialised pieces of software, used for importing, processing and further working with predicted structures.

This means that, for many practical applications, users don’t need to run AlphaFold2 predictions manually. You don’t even need to download the structures from the AFDB. These specialist programs offer automated access to AlphaFold2 structures as standard.

For example, suppose you are an experimental structural biologist interested in solving a crystal structure by molecular replacement. We recommend using automated software for crystallography like [MrBUMP](https://doi.org/10.1107/S2059798318003455) from the [CCP4 Suite](https://www.ccp4.ac.uk/) ([Agirre et al., 2023](https://doi.org/10.1107/S2059798323003595)) . It will automatically analyse your protein sequence, fetch the corresponding predicted structures from AFDB, and solve the structure. No user intervention is required ([Simpkin et al., 2023](https://doi.org/10.1107/S2059798323006289)).








| Software | AlphaFold2 functions supported |
| --- | --- |
| [CCP4: Software for Macromolecular X-Ray Crystallography](https://www.ccp4.ac.uk/) | * Integrates AlphaFold in all relevant software, such as molecular replacement pipelines * Automated import of AlphaFold models * [CCP4 Cloud](https://cloud.ccp4.ac.uk/) can run AlphaFold modeling ([Simpkin et al., 2023](https://doi.org/10.1107/S2059798323006289)). |
| [CCP-EM](https://www.ccpem.ac.uk/) | * Import from the AFDB |
| [ChimeraX](https://www.cgl.ucsf.edu/chimerax/docs/user/commands/alphafold.html) | * Modelling via ColabFold * Retrieving from the AFDB ([see presentation](https://www.rbvi.ucsf.edu/chimerax/data/alphafold-nov2021/af_sbgrid.html)) * Interactive visualization of PAE plots |
| [COOT](https://www2.mrc-lmb.cam.ac.uk/personal/pemsley/coot/) | * Import from the AFDB |
| [DALI server](http://ekhidna2.biocenter.helsinki.fi/dali/) | * Structure-based search over AFDB |
| [Foldseek Search Server](https://search.foldseek.com/search) | * Structure-based search over AFDB |
| [Jalview](https://www.jalview.org/) | * Import from the AFDB |
| [Mol\* Viewer](https://molstar.org/viewer/) | * Import from the AFDB |
| [PHENIX](https://phenix-online.org/) | * Integrates AlphaFold in all relevant software, such as molecular replacement pipelines ([Oeffner et al., 2022)](https://doi.org/10.1107/S2059798322010026) |
| [PyMOL](https://pymol.org/) | * Import from the AFDB, pLDDT colouring to illustrate regions of high and low confidence |
