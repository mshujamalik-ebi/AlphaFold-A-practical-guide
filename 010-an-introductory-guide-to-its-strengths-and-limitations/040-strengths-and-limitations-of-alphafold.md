---
layout: default
title: Strengths and limitations of AlphaFold 2
---

# Strengths and limitations of AlphaFold 2

**What a neural network can and can’t do largely depends on the data used for its training. For training AlphaFold2, only the protein parts of the PDB structures were used: other parts like small molecules and nucleic acids were not included in the training. This means there are some aspects of the structures that AlphaFold cannot predict, or cannot guarantee accuracy.**

## **What AlphaFold can do**

AlphaFold2 was originally trained on single protein chains, so it excels at predicting their structures. Later, an extension of AlphaFold2 was trained specifically to predict protein-protein complexes: this version is now known as AlphaFold-Multimer ([Evans et al., 2022](https://doi.org/10.1101/2021.10.04.463034)). It can predict the structures of protein complexes that are made of several copies of the same chain (homo-multimers such as dimers and hexamers) as well as those made of several different protein chains (hetero-multimers). For specific limitations, see section “[Accessing and predicting protein structures with AlphaFold2](https://www.ebi.ac.uk/training/online/courses/alphafold/accessing-and-predicting-protein-structures-with-alphafold/)”.

Crucially, AlphaFold2 does not simply replicate known protein structures. Independent researchers have shown that AlphaFold2 can predict structures never previously seen in the PDB, i.e. novel protein folds ([Bordin et al., 2023](https://doi.org/10.1038/s42003-023-04488-9); [Barrio-Hernandez et al., 2023](https://doi.org/10.1038/s41586-023-06510-w); [Durairaj et al., 2023](https://doi.org/10.1038/s41586-023-06622-3)).












##### Figure 5. Uncharacterised protein (AlphaFold ID: [AF-A0A849ZK06-F1](https://alphafold.ebi.ac.uk/entry/A0A849ZK06))

Predicted to be a ribonucleotide-binding protein with an overall structure that resembles a protein kinase fold, molecular function predicted by DeepFRI ([Barrio-Hernandez et al., 2023](https://doi.org/10.1038/s41586-023-06510-w))

AlphaFold2 can be used to identify intrinsically disordered regions. Naturally, the system cannot predict disordered or dynamic substructures, or the structures of sequences that do not exist in one set conformation in nature. Such regions are truly dynamic and do not have a fixed structure to predict. However, AlphaFold2’s local confidence metric (pLDDT) exhibits a strong correlation with intrinsic disorder, making AlphaFold a state-of-the-art tool for identification of the disordered regions ([Tunyasuvunakool et al., 2021](https://doi.org/10.1038/s41586-021-03828-1); [Akdel et al., 2022](https://www.nature.com/articles/s41594-022-00849-w)).

## **What AlphaFold2 struggles with**

Out of the box, AlphaFold is not sensitive to point mutations that change a single residue, due to the alteration in the DNA sequence. This is because of a lack of data on the effect of variations, combined with AlphaFold2’s focus on patterns as opposed to calculating physical forces. For the same reasons, AlphaFold2 is also less accurate at predicting the structures associated with highly variable sequences, such as those of immune system molecules like antibodies.

AlphaFold2 struggles to predict the structures of “orphan” proteins – those with few close relatives – as it works by deriving relationships between protein sequences. If there are not enough sequences for comparison, AlphaFold2 often produces low-quality predictions with poor confidence scores. This problem is exacerbated if the few related sequences do not have known structures in the PDB. On the other hand, this methodological choice means AlphaFold2 can often predict protein structure, even if there are no known related structures in the PDB, provided a sequence has thousands of relatives.

Proteins undergo structural changes when they perform their functions. However, these different conformations are only described for a minority of the proteins in the PDB. By default, AlphaFold2 does not capture such conformational changes, as it was designed to predict static structures, i.e. structural snapshots. However, researchers have found that, by applying certain tricks, one can force AlphaFold2 to produce a different conformation of the protein (see section “[Advanced modelling and applications of predicted protein structures](https://www.ebi.ac.uk/training/online/courses/alphafold/advanced-modeling-and-applications-of-predicted-protein-structures/)“).

![](https://ftp.ebi.ac.uk/pub/training/2024/On-demand/PDBe_KB_2.gif)


Figure 6. One of AlphaFold’s limitations is that it is not aware of molecules that bind to proteins, which can affect the protein’s 3D structure. Hexokinase ([Q96Y14](https://www.uniprot.org/uniprotkb/Q96Y14/entry)) adopts distinct conformations in the presence (orange, left) and absence (green, right) of sugar. Notably, AlphaFold’s structure prediction aligns with the sugar-free state (as could be seen both visually and via RMSD value).

Sugar-bound PDB ID:[2E2Q](https://www.wwpdb.org/pdb?id=pdb_00002e2q)

Sugar-free PDB ID: [2E2N](https://www.wwpdb.org/pdb?id=pdb_00002e2n)

## **What AlphaFold2 can’t do**

AlphaFold2 is not aware of other molecules that interact with proteins, such as nucleic acids, small molecule co-factors, ions and other non-protein components. Similarly, AlphaFold2 was not designed to model post-translational modifications, or to model structures of free nucleic acids. However, AlphaFold2 may often predict a ligand- or ion-bound form of a protein, even in the absence of the actual ligand/ion.

AlphaFold2 is not aware of the membrane plane. Consequently, it cannot correctly model the relative orientations of trans-membrane domains and other protein domains of the membrane proteins. However, as noted, AlphaFold2 alerts users to uncertainties by assigning a low confidence score. This specific issue is normally reflected in the predicted aligned error (PAE) score. (See section “[Inputs and Outputs](https://www.ebi.ac.uk/training/online/courses/alphafold/inputs-and-outputs/)“).





Bulleted Table



| AlphaFold2 predicts | AlphaFold2 struggles to predict | AlphaFold2 doesn’t predict |
| --- | --- | --- |
| * Single protein chains * Protein multimers * Multisubunit protein-protein complexes | * Multiple conformations for the same sequence * Effects of point mutations * Antigen-antibody interactions | * Protein-DNA and protein-RNA complexes * Nucleic acid structure * Ligand and ion binding * Post-translational modifications * Membrane plane for transmembrane domains |
