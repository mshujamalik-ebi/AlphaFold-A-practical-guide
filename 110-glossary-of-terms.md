---
layout: default
title: 'Glossary of terms'
---

# Glossary of terms

This glossary focuses on terms that are specific to AlphaFold and protein folding. For a wider set of terms used in protein biology and structural biology, we recommend the Protein Data Bank’s extensive [glossary](https://www.rcsb.org/docs/general-help/glossary).

* **AlphaFold Protein Structure Database (AFDB)**: a database of over 214 million predicted protein structures from AlphaFold, created collaboratively by Google DeepMind and EMBL-EBI.
* **Amino acid**: a small carbon-based molecule that serves as a building block of proteins. Each amino acid contains a basic amino group, an acidic carboxyl group, and a hydrogen or organic side chain attached to the central carbon atom.
* **BigQuery**: Google’s serverless and cost-effective enterprise data warehouse that works across clouds and scales with your data.
* **Critical Assessment of Structure Prediction (CASP)**: an experimental test of protein structure predictions, which has been carried out every two years since 1994.
* **Cofactor**: a non-protein chemical compound or metal ion required for the activity of an enzyme.
* **Colab**: short for Colaboratory. A system that enables you to write and execute Python in your browser.
* **ColabFold**: a community implementation of a Colab for running AlphaFold and other tools like RoseTTAFold.
* **Complex**: a large molecular structure composed of two or more molecules, such as several proteins, protein(s) with ligand or protein(s) with nucleic acid. A complex composed entirely of proteins may be called a multimer.
* **Cross-linking mass spectrometry (XL-MS)**: an experimental technique for identifying proximal structural regions within a protein. A target protein is mixed with reagents that form covalent bonds to it. The protein is then digested, and interacting parts identified using mass spectrometry.
* **Cryogenic electron microscopy (cryo-EM)**: electron microscopy performed at a very low temperature. It enables researchers to examine large biomolecular structures and complexes in near-physiological states.
* **Evoformer**: the neural network at the heart of AlphaFold.
* **Global distance from ground truth (GDT\_TS)**: A measure of the accuracy of a predicted protein structure when compared to the experimentally determined structure. This score is used by CASP. Scores range from 0 (entirely inaccurate) to 100 (perfect accuracy).
* **Intrinsically disordered protein (IDP)**: a protein that naturally does not have a fixed 3D structure but instead displays a high degree of flexibility. Some proteins have intrinsically disordered regions (IDRs) that sit alongside highly structured regions.
* **Interface predicted template modelling (ipTM)**: a measure of the accuracy of the predicted structure of a multimer, used by AlphaFold-Multimer. It measures the accuracy of the predicted interface between the subunits of the protein-protein complex.
* **Ligand**: a molecule that binds specifically to another molecule, such as a protein or nucleic acid, to form a complex. A ligand is often a small molecule, but can be a protein.
* **Missense**: the most common type of genetic variant. A missense variant is a single change in the DNA sequence, resulting in the substitution of one amino acid for another in a protein.
* **Multimer**: a complex composed entirely of proteins.
* **Multiple sequence alignment (MSA)**: a dataset in which multiple similar and/or related protein sequences are aligned by identical or similar regions. AlphaFold uses MSAs to predict the structures of novel proteins.
* **Predicted aligned error (PAE)**: a measure of how confident AlphaFold is in the relative position of two residues within a predicted protein structure. It is defined as the expected positional error at residue X, measured in Ångströms (Å), if the predicted and actual structures were aligned on residue Y. It is effectively a measure of how confident AlphaFold is that the protein’s domains are well packed and that the relative placement of the domains in the predicted structure is correct.
* **Pair representation**: a representation of every pair of amino acid residues in a protein. Pair representations encode information about the evolutionary relationships between each pair of amino acids, which can ultimately be interpreted as positional information.
* **Peptide**: a single chain of amino acids joined by peptide bonds. Compared to proteins, peptides may be quite short, and always only consist of one chain.
* **Protein Data Bank (PDB)**: a free database containing all macromolecular structures that have ever been experimentally determined and published. Its core archive holds 3D atomic coordinates of structural models of proteins, plus DNA and RNA. It also includes complexes of these molecules with metals and small molecules, plus related experimental data and metadata.
* **PDB100 database**: a clustered version of the PDB. It was created by searching each representative structure in the PDB against the AlphaFold Database, using Foldseek.
* **Predicted local distance difference test (pLDDT)**: a metric used by AlphaFold to estimate local confidence, at the level of individual amino acid residues, in a predicted protein structure. It is scaled from 0 to 100, with higher scores indicating higher confidence.
* **Protein**: a large biological molecule composed of one or more long chains of amino acids joined by peptide bonds.
* **Predicted template modelling score (pTM)**: an integrated measure of how well AlphaFold-Multimer has predicted the structure of a complex. It is the predicted template modelling (TM) score for a superposition between the predicted structure and the hypothetical true structure. pTM scores vary between 0 and 1: a score above 0.5 means the overall predicted fold for the complex will be similar to the true structure.
* **Random seed**: a randomly-generated number used to initialise AlphaFold structure predictions.
* **Recycling**: in the context of AlphaFold, the normal final step in predicting a structure. AlphaFold takes its initial outputs and puts them back through the structure prediction process. Users can vary the number of times the software recycles data: in some cases, more recycles can yield better predictions.
* **Relaxation**: an optional final step in protein structure prediction. Relaxing entails making small changes to the predicted structure, using gradient descent in the AMBER force field. Relaxation can help to resolve rare stereochemical violations and clashes. by making small adjustments to the structure.
* **Residue**: an amino acid that has been incorporated into a peptide chain to form a protein. Three atoms, equivalent to a water molecule, are removed from the amino acid molecule in this process.
* **Root mean square deviation (RMSD)**: a measure of the weighted average distance (or deviation) between corresponding atoms when two similar structures are superimposed. A smaller RMSD means a better match. Two identical structures would have an RMSD of 0 Ångströms (Å). An RMSD bigger than 2-3 Å suggests that the structures are substantially different.
* **template**: a protein structure that can be supplied to modelling software, including AlphaFold, to help guide the prediction of a novel structure
* **UniProt:** a free database of protein sequences and functional annotation, contains biological function of proteins which is derived from the research literature.
* **X-ray crystallography**: an experimental method used to determine the detailed three-dimensional structures of molecules, including proteins. It requires shining an X-ray beam onto a crystal of the molecule being studied. The rays will be scattered in a distinctive pattern that allows calculation of the molecule’s shape.
