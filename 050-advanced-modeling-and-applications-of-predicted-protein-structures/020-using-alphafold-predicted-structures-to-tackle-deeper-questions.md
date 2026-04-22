---
layout: default
title: 'Using AlphaFold2 predicted structures to tackle deeper questions'
---

# Using AlphaFold2 predicted structures to tackle deeper questions

**AlphaFold2 predicted structures have many uses, beyond pure structural biology. By predicting the structures of proteins that have not yet been solved, AlphaFold2 enables the generation of hypotheses about those proteins’ functions and interactions. Furthermore, the ability to compare proteins by shape enables us to uncover deep evolutionary relationships. AlphaFold2 is not intended for, validated for or approved for clinical use – see Disclaimer** [1](https://www.ebi.ac.uk/training/online/courses/alphafold/advanced-modeling-and-applications-of-predicted-protein-structures/using-alphafold-predicted-structures-to-tackle-deeper-questions/#:~:text=1.%20Disclaimer%3A%20%E2%80%9CAlphaFold,a%20qualified%20professional.%E2%80%9D).

## **AlphaFold2 can help uncover proteins’ functions and evolutionary relationships**

AlphaFold2’s ability to predict protein structure can be invaluable for picking out the function(s) a protein performs. It can also help identify the evolutionary relationships between proteins, such as shared ancestry.

The conventional computational approach to determining the function of a target protein is to look for proteins with similar amino acid sequences. The underlying assumption is that proteins with similar sequences perform similar functions.

However, sequence search sometimes misses good matches. This is because proteins with similar structures, and therefore functions, can have substantially different amino acid sequences. In general, protein structure is more conserved than amino acid sequence. Because AlphaFold2 provides predicted structures for proteins that have not yet been solved, it makes it possible to predict the functions of these unknown proteins.

In addition, the ability to compare proteins on the basis of their structure, which is more conserved, allows you to see much farther back in evolutionary time. This allows you to identify very distant relatives that evolved from the same precursor protein ([Monzon et al., 2022](https://doi.org/10.1093/bioadv/vbac072)). In contrast, you are likely to miss deeper evolutionary relationships between proteins if you only focus on their amino acid sequences.












##### Figure 27. Example of potential homologs

The human protein epithelial membrane protein 3 (EMP3) (solid, [AF-P54852-F1](https://alphafold.ebi.ac.uk/entry/P54852)) shares surprising similarities with an unknown protein from a C. elegans (transparent, [AF-G5EBZ7-F1](https://alphafold.ebi.ac.uk/entry/G5EBZ7)). This unexpected connection, revealed by the RBSH approach, suggests potential shared functions or evolutionary relationships between these seemingly distant organisms ([Monzon et al., 2022](https://doi.org/10.1093/bioadv/vbac072)).

Structural search programs such as [Foldseek](https://search.foldseek.com/search) ([van Kempen et al., 2023](https://doi.org/10.1038/s41587-023-01773-0)) make it easy to find proteins with similar 3D shapes. They do this by searching for similar structures against several protein structure databases, including AFDB and PDB.

Foldseek can be used to cluster proteins by their 3D structure. Such clusters are available [through the AFDB](https://alphafold.ebi.ac.uk/entry/Q5VSL9#:~:text=Structure%20similarity%20cluster), which contains over 200 million predicted protein structures. Clustering proteins by their structure is crucial for analysing groups of distantly-related proteins.

As always, you must remember to critically assess all predicted structures from AlphaFold2, using confidence metrics like pLDDT and PAE (see section “[Evaluating AlphaFold2’s predicted structures using confidence scores](https://www.ebi.ac.uk/training/online/courses/alphafold/inputs-and-outputs/evaluating-alphafolds-predicted-structures-using-confidence-scores/)“).

## **Further insights from AlphaFold2 predicted structures**

Predicted structures can help generate and test hypotheses about where and how a protein might interact with other proteins or molecules.

For example, they can be used to identify binding sites or active sites. Some studies have successfully used AlphaFold-predicted structures to guide virtual screening or docking studies, identifying promising small-molecule binders or inhibitors ([Baselious et al., 2023](https://doi.org/10.1016/j.compbiomed.2023.107700); [Liu et al., 2022](https://doi.org/10.1093/bib/bbac365); [Ren et al., 2022](http://DOI	https://doi.org/10.1039/D2SC05709C); [Weng et al., 2022](https://doi.org/10.1155/2022/4629392); [Yang et al., 2022](https://doi.org/10.34133/2022/9781758)). Rigid docking against AlphaFold structures has proved inefficient ([Wong et al., 2022](https://doi.org/10.15252/msb.202211081)); still, successful studies have employed either flexible docking or molecular dynamics simulations ([Baselious et al., 2023](https://doi.org/10.1016/j.compbiomed.2023.107700); [Liu et al., 2022](https://doi.org/10.1093/bib/bbac365); [Weng et al., 2022](https://doi.org/10.1155/2022/4629392); [Zhang et al., 2023](https://doi.org/10.1021/acs.jcim.2c01219))

These predicted structures are also instrumental in guiding mutational analysis research. For example, introducing mutations to alter the structure of a binding pocket, without knowing the protein structure, would take a lot of trial and error. Predicted structures from AlphaFold could narrow down candidate mutations. Similarly, you may conduct mutational analyses of protein-protein interfaces once these have been predicted by AlphaFold.

AlphaFold enables visualisation of known mutations associated with a disease in the context of a highly accurate protein structure for early-stage scientific research.

1. Disclaimer: “AlphaFold is a research tool and its outputs have varying levels of confidence. The information provided in these modules and by AlphaFold (including in the AlphaFold Database) is provided free of charge, strictly as-is and without representation or warranty of any kind. We are not responsible for the accuracy, reliability, availability, effectiveness, or correct use of this information or for any impact from ongoing use of such information. If you rely on any such information, you do so solely at your own risk. These modules, AlphaFold and its outputs are not intended for, have not been validated for, and are not approved for clinical use. You should not use any of this information for clinical purposes or rely on it for medical or other professional advice. Any content regarding those topics is provided for informational purposes only and is not a substitute for advice from a qualified professional.”
