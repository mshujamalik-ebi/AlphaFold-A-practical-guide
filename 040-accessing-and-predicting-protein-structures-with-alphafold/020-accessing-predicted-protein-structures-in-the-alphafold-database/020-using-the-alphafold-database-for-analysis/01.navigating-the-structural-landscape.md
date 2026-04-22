---
layout: default
title: 'Navigating the structural landscape'
---

# Navigating the structural landscape

## Structure similarity cluster

The AFDB now incorporates information about structurally similar proteins, facilitating exploration of the protein universe and understanding relationships between different proteins. This feature is based on the concept of clustering, providing valuable insights into protein similarity and evolutionary relationships.

### **Understanding AFDB Clustering**

The clustering process in the AFDB involves two main steps:

1. **Sequence-based clustering (AFDB50/MMseqs2):** The initial step employs [MMseqs2](https://github.com/soedinglab/MMseqs2), a fast and sensitive protein sequence searching and clustering tool ([Steinegger et al., 2017](https://doi.org/10.1038/nbt.3988)), to group the 214 million UniProtKB protein sequences in AFDB based on sequence similarity. This creates a reduced set of clusters, each represented by the protein with the highest average pLDDT score.
2. **Structure-based clustering (AFDB/Foldseek):** The representative proteins from the first step are then further clustered using [Foldseek](https://github.com/steineggerlab/foldseek), a powerful tool designed for fast and sensitive comparison of protein structures ([van Kempen et al., 2023](https://doi.org/10.1038/s41587-023-01773-0)). Foldseek identifies similarities in the 3D shapes of proteins, ensuring that proteins within a cluster share not only sequence similarity but also structural resemblance.

### **How to access cluster members in AFDB**

On each protein’s page in the AFDB, you’ll find a table listing its cluster members. This table provides links to the pages of other proteins in the same cluster, allowing you to quickly compare their structures and explore potential functional relationships.

![](https://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2024/11/Screenshot-2024-11-22-at-13.16.44-1024x715.png)


Figure 28. AlphaFold Database presents structurally similar protein predictions in clusters at the bottom of prediction pages, such as this one for  [D435](https://alphafold.ebi.ac.uk/entry/D435)  from uncultured bacteria. You can explore these clusters using two different methods: AFDB50/MMseqs2 or AFDB/Foldseek. To help you analyze these predictions, you can filter and sort them according to your needs.

### **Why are cluster members useful?**

Exploring cluster members can provide valuable insights:

* **Evolutionary relationships:** Proteins clustered together may share a common evolutionary origin, even if their sequences have diverged significantly.
* **Functional similarities:** Structural similarity often implies functional similarity. Examining cluster members can help predict the function of uncharacterised proteins.
* **Unexpected connections:** Clustering can reveal unexpected structural similarities between proteins from different species or with different functions.

---

## **Structure-based search in the AlphaFold Database using Foldseek**

Structure-based search focuses on identifying similarities between protein 3D structures rather than their sequences. This approach is critical for understanding proteins with low sequence similarity but conserved structural features, which often indicate functional or evolutionary relationships.

### **How Foldseek works**

Foldseek achieves its efficiency by simplifying 3D structures into a linear, one-dimensional representation through its unique ‘3Di alphabet’. This approach captures key local interactions within the protein structure using a pre-trained 3Di substitution matrix. The resulting linear representation allows Foldseek to leverage MMseqs2, to rapidly scan extensive databases and identify structural matches.

### **Integration of Foldseek into the AlphaFold Database**

Foldseek is seamlessly integrated into the AFDB website. Simply search for your protein of interest, navigate to the “Similar structures” section, and you can launch a structure-based search against clustered predicted models in the AFDB (AFDB50) and experimentally determined structure from the Protein Data Bank (PDB).

The PDB collection is updated weekly to incorporate the latest releases from the Worldwide Protein Data Bank, ensuring you can always access the most current entries for their searches.

The results are clearly presented and can be filtered and sorted to help you find the most relevant matches. You can align selected proteins with their query to assess the match quality. Visualisation options include toggling between full-chain colouring and pLDDT-based colouring of the query. The results are clearly presented and can be filtered and sorted.

![AlphaMissense in the AFDB](https://github.com/paulynamagana/AFDB_notebooks/blob/main/Presentation3.gif?raw=true)


Figure 29. AlphaFold Database showing Foldseek integration for [D435.](https://alphafold.ebi.ac.uk/entry/A0A1Y0BDV9)

Each result includes an E-value, indicating the statistical significance of the structural match. Lower e-values suggest a higher degree of similarity. The structural superposition is accompanied by a root-mean-square deviation (RMSD) value, highlighting the average distance between corresponding atoms in the aligned structures. You can also download the aligned structures for further analysis.

### **What can Foldseek reveal?**

Foldseek can uncover surprising similarities between proteins that have evolved independently, shedding light on their shared ancestry or convergent evolution.

Finding a structural match to a protein with a known function can provide clues about the function of an unknown protein.

![](https://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2024/11/Screenshot-2024-11-22-at-13.10.01.png)


Figure 30. Foldseek revealed a surprising structural similarity between [DNA replication ATP-dependent helicase/nuclease DNA2](https://alphafold.ebi.ac.uk/entry/P51530), a protein involved in DNA repair in humans, and Cas4 (PDB ID: [8D3M](https://www.ebi.ac.uk/pdbe/entry/pdb/8d3m)), a protein involved in bacterial immune systems. Despite having very different sequences, they share a common structural core, suggesting a distant evolutionary relationship.
