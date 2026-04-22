---
layout: default
title: 'Introducing AlphaFold 3'
---

# Introducing AlphaFold 3

**Although AlphaFold 3 is based on the same general principles as AlphaFold 2, it has a substantially updated architecture. This enables AlphaFold 3 to model complexes that contain multiple classes of biomolecules. These include DNA, RNA, small molecule ligands, ions, post-translational modifications of proteins, and chemical modifications of nucleic acids.**

## Expanding the scope of AlphaFold

Biological macromolecules, such as proteins and nucleic acids, rarely work in isolation. Instead, they form large complexes to perform sophisticated tasks, like photosynthesis. Crucially, these complexes often include small molecules called ligands and bound ions. These molecules enhance the complex’s function, for instance by helping to perform chemical reactions or regulating the activity of the large proteins. Furthermore, many proteins and nucleic acids are chemically modified during their natural life cycle, for example, through phosphorylation or glycosylation. Such modifications often regulate their function.












##### Crystal structure of β-D-glucosidase from Aspergillus fumigatus (PDB ID: [5FJI](https://www.wwpdb.org/pdb?id=pdb_00005fji)) displays extensive N-glycosylation

##### Crystal structure of NF-κB p52 homodimer bound to P-Selectin κB DNA (PDB ID: [7CLI](https://www.wwpdb.org/pdb?id=pdb_00007cli)) showcases a critical protein-DNA interaction

Figure 34. Diverse macromolecular interactions revealed by 3D structures.

To fully understand cellular functions, we need accurate structures of complete biological complexes that include all of these molecules and modifications.

AlphaFold 2 has been successful at predicting the structures of proteins and protein-protein complexes. This suggested it could be possible to accurately predict the structures of complexes containing a much wider range of biomolecules, including ligands, ions, nucleic acids and modified residues, within a single deep-learning framework.

Previously, researchers have developed predictors for specific interaction types: for instance, Metal3D predicts the positions of metal ions bound to proteins ([Durr et al., 2023](https://doi.org/10.1038/s41467-023-37870-6)). One group also devised a generalist method, independent of AlphaFold, that accommodates ligands and amino acid modifications ([Krishna et al., 2024](https://doi.org/10.1126/science.adl2528)). However, these deep-learning systems have a mixed record on accuracy and often fail to generalise ([Buttenschoen et al., 2023](https://doi.org/10.1039/D3SC04185A); [Das et al., 2023](https://doi.org/10.1002/prot.26602)).

## AlphaFold 3

AlphaFold 3 was developed as a collaboration between [Google DeepMind](https://deepmind.google/) and [Isomorphic Labs](https://www.isomorphiclabs.com/). It can accurately predict the structures of complexes that contain all the molecular types present in the [Protein Data Bank](https://www.ebi.ac.uk/pdbe/), except water molecules. AlphaFold 3 handles complexes of protein with DNA, RNA, small molecule ligands, and ions; the structures can include post-translational modifications of proteins (including glycosylation) and chemical modifications of nucleic acids.

AlphaFold 3 can also predict the structures of single molecules such as protein monomers, single- and double-stranded DNA and single RNA chains.

AlphaFold 3 represents a significant advance in multimodal molecular structure prediction. At its release, it demonstrated state-of-the-art performance across a wide range of molecular types, often substantially outperforming previous specialised methods for tasks such as protein structure prediction, protein-protein complexes, and notably, antigen-antibody interactions. The one exception is RNA: AlphaFold 3, at the time of its release, was noted to outperform all automated systems but not quite as good as systems that involve human expert intervention.

[
](https://storage.googleapis.com/gweb-uniblog-publish-prod/original_videos/AFS-anim-7R6R.mp4)

[7R6R](https://www.wwpdb.org/pdb?id=pdb_00007R6R) – DNA binding protein: AlphaFold 3’s prediction for a molecular complex featuring a protein (blue) bound to a double helix of DNA (pink) is a near-perfect match to the true molecular structure discovered through painstaking experiments (gray).

[
](https://storage.googleapis.com/gweb-uniblog-publish-prod/original_videos/AFS-anim-7PNM.mp4)

[7PNM](https://www.wwpdb.org/pdb?id=pdb_00007PNM) – Spike protein of a common cold virus (Coronavirus OC43): AlphaFold 3’s structural prediction for a spike protein (blue) of a cold virus as it interacts with antibodies (turquoise) and simple sugars (yellow), accurately matches the true structure (gray). The animation shows the protein interacting with an antibody, then a sugar. Advancing our knowledge of such immune-system processes helps better understand coronaviruses, including COVID-19, raising possibilities for improved treatments.

[
](https://storage.googleapis.com/gweb-uniblog-publish-prod/original_videos/AFS-anim-7BBV.mp4)

[7BBV](https://www.wwpdb.org/pdb?id=pdb_00007bbv) – Enzyme: AlphaFold 3’s prediction for a molecular complex featuring an enzyme protein (blue), an ion (yellow sphere) and simple sugars (yellow), along with the true structure (gray). This enzyme is found in a soil-borne fungus (Verticillium dahliae) that damages a wide range of plants. Insights into how this enzyme interacts with plant cells could help researchers develop healthier, more resilient crops.

## Overview of AlphaFold 3 inputs

AlphaFold 3 can accept multiple sequences for proteins, DNA and RNA. Small molecule ligands can be specified using the [Chemical Component Dictionary (CCD)](https://www.wwpdb.org/data/ccd) codes. Similarly, ions, glycans and chemically-modified amino acids and nucleotides, are also specified using the CCD codes. However, AlphaFold Server offers a limited selection of these ligands, ions, and post-translational modifications (PTMs) compared to the full capabilities of the underlying AlphaFold 3 model.

As with AlphaFold 2, AlphaFold 3 uses MSA behind the scenes as an input, but for RNA chains as well as proteins. Additionally, it may or may not use protein template structures (see section on [AlphaFold 2](https://www.ebi.ac.uk/training/online/courses/alphafold/inputs-and-outputs/a-high-level-overview/)). Adjusting these inputs may change output predictions, for instance producing another structural state.

AlphaFold 3 uses random seeds (see section on [AlphaFold 2](https://www.ebi.ac.uk/training/online/courses/alphafold/inputs-and-outputs/a-high-level-overview/)) to initialise structure prediction runs. These may be automatically generated or explicitly specified.

## How to access AlphaFold 3

Inference source code of AlphaFold 3 is available on [GitHub](https://github.com/google-deepmind/alphafold3) and could be installed locally, on a virtual machine or on the server, subject to the [terms of use](https://github.com/google-deepmind/alphafold3/blob/main/WEIGHTS_TERMS_OF_USE.md). Please check the section “[Using the AlphaFold 3 source code](https://www.ebi.ac.uk/training/online/courses/alphafold/using-the-alphafold-3-source-code/)” for hardware requirements. Only researchers affiliated with a non-commercial organisation can request access to the AlphaFold3 model parameters.

AlphaFold 3 is also available through the AlphaFold Server to predict biomolecular structures and interactions. The Server provides full AlphaFold 3 functionality for proteins and nucleic acids, but it has certain limitations: for instance, ligands, ions and chemical modifications must be selected from the list of available ligands and modifications (see subsection “[AlphaFold Server: Your gateway to AlphaFold 3](https://www.ebi.ac.uk/training/online/courses/alphafold/alphafold-server-your-gateway-to-alphafold-3/)“).
