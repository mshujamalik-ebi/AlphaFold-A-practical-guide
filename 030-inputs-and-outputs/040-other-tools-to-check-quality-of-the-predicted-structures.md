---
layout: default
title: 'Other tools to check quality of the predicted structures'
---

# Other tools to check quality of the predicted structures

**Users who wish to further evaluate the quality of predicted protein structures from AlphaFold2 can use a variety of open-source tools.**

## **Open-source tools for evaluating predicted structures**

One option is a general structural biology validation tool like [MolProbity](http://molprobity.biochem.duke.edu/). These are used for diagnosing “correctness” in 3D models of proteins, nucleic acids or complexes. AlphaFold2 models generally have excellent geometrical quality in high-confidence regions. Nevertheless, if MolProbity flags part of the structure, you should examine it carefully.

For protein-protein complexes, tools like [PISA](https://www.ebi.ac.uk/pdbe/pisa/) can be used to further assess the quality of the predicted interface. The software allows you to check details like the total buried surface area and the number of cross-interface hydrogen bonds, which in turn give an indication of whether the predicted interface corresponds to reality or is artefactual. Note that PISA validation criteria may have some exceptions, e.g. strongly bound antibody-antigen complexes could be reported as weakly bound by PISA.

The [PAE viewer](http://www.subtiwiki.uni-goettingen.de/v4/paeViewerDemo) is a web server designed to facilitate the interpretation of PAE scores for multimeric predictions. The visualisation highlights the violations and/or satisfactions of crosslinker length restraints.
