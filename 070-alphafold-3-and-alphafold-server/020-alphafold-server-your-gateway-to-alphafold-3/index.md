---
layout: default
title: 'AlphaFold Server: Your gateway to AlphaFold 3'
---

# AlphaFold Server: Your gateway to AlphaFold 3

AlphaFold Server is a user-friendly online portal for making AlphaFold 3 structure predictions.  
AlphaFold Server will run most structural predictions that AlphaFold 3 can handle, with a few limitations dictated by the license terms. AlphaFold Server also has some additional features for advanced users.

## What AlphaFold Server can do

[AlphaFold Server](https://alphafoldserver.com) is a web service powered by AlphaFold 3. It can generate highly accurate predictions of the structures of biomolecular complexes containing any combination of proteins, DNA, RNA, ligands, ions, and chemical modifications of proteins and nucleic acids.

AlphaFold Server is currently available for non-commercial use to individuals and academic and non-commercial organisations (universities, non-profit organisations and research institutes, educational and government bodies).

You need to register using your Google account to use AlphaFold Server. However, the service is free and you do not need to install any software on your computer.

![](http://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2025/06/Screenshot-2025-06-24-at-16.29.09.png)

Figure 39. A screenshot of the AlphaFold Server user interface. The user is preparing to model a protein-DNA complex with calcium and sodium ions.

You can use AlphaFold Server to model a structure consisting of one or more of the following types of biological molecule:

* Proteins
* DNA
* RNA
* Biologically common ligands ranging from ATP to chlorophyll
* Biologically common metal ions and chlorine ions
* Biologically common post-translational modifications (PTMs) of amino acid residues, ranging from phosphorylation to citrullination
* Protein glycosylation, including branched glycan chains, composed of most common sugars
* Biologically common chemical modifications of DNA and RNA, such as methylation and formylation

The modelled structure can be composed of multiple proteins, nucleic acids, ligands, and ions. Furthermore, each protein and nucleic acid chain can have any number of chemical modifications.

AlphaFold Server will try to model all the interactions between all the molecules supplied in the job’s input. For the complete list of the available ligands, ions and chemical modifications, see the [AlphaFold Server FAQ](https://alphafoldserver.com/faq#what-biological-molecule-types-can-be-modeled-with-alphafold-server).

AlphaFold Server allows you to control how structural templates are used in your predictions. You can specify a cut-off date for the PDB templates to be used, use PDB templates with the default cut-off date or turn off the use of templates altogether.

![](http://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2025/06/Screenshot-2025-06-24-at-16.31.38.png)

Figure 40. A screenshot showing the setting for using PDB templates.

Each modelling job is limited to 5,000 tokens, due to the high computational demands of larger structures. One token corresponds to:

* one amino acid residue or one nucleotide,
* one atom of a ligand, ion or chemically modified amino acid residue or nucleotide

The minimum sequence length for the macromolecules is four amino acids or four nucleotides: this enables modelling of complexes with peptides. There are no limits on the maximal sequence length for individual protein and nucleic chains, other than the overall 5,000-token limit.

## What AlphaFold Server can’t do

AlphaFold Server is for non-commercial use only, subject to [AlphaFold Server Terms of Service](https://alphafoldserver.com/terms). AlphaFold Server outputs cannot be used in docking or screening tools or to train machine learning models or related technology for biomolecular structure prediction similar to AlphaFold Server. However, you can publish, share and adapt AlphaFold Server output in accordance with the [AlphaFold Server Terms of Service](https://alphafoldserver.com/terms). You are required to provide clear notice that ongoing use is subject to the [AlphaFold Server Output Terms of Use](https://alphafoldserver.com/output-terms), and if you have made any modifications to the predictions.

AlphaFold Server only supports the specific ligands, ions and modifications that are on the list in the [FAQs](https://alphafoldserver.com/faq#what-biological-molecule-types-can-be-modeled-with-alphafold-server). In particular, AlphaFold Server is not capable of predicting the positions of water molecules or hydrogen atoms.

AlphaFold Server is not aware of membrane planes, so predicted structures for membrane proteins do not take the membrane plane into account. However, there have been reports that adding 50-100 fatty acid molecules such as oleic acid to a prediction mimics a membrane. This may even induce AlphaFold Server to predict the correct conformation of a membrane protein, with intracellular and extracellular domains adopting correct positions.

Each user is limited to 30 jobs per day. In the future the team plan to explore other approaches for quota allocation, such as weekly or monthly allocations. If you don’t have enough quota, you can save your job and submit it when your quota refreshes (at midnight, BST time zone).

It is not currently possible to customise MSAs or templates, but the team is working on these features.  
Finally, AlphaFold Server has all the limitations of the full AlphaFold 3 model described above (see [What AlphaFold 3 struggles with](https://www.ebi.ac.uk/training/online/courses/alphafold/introducing-alphafold-3/what-alphafold-3-struggles-with/)).

AlphaFold Server is in active development, with many more features in the pipeline. See the [release updates notes](https://alphafoldserver.com/release-updates) to stay updated on the latest improvements on the AlphaFold Server.
