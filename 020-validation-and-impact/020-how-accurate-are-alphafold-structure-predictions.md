---
layout: default
title: How accurate are AlphaFold 2 structure predictions?
---

# How accurate are AlphaFold 2 structure predictions?

**High-confidence regions of AlphaFold2 structure predictions are usually very close to the experimental structures, and therefore very useful in designing downstream experiments. However, low-confidence regions may deviate substantially. AlphaFold2 gets the fold and majority of the side chain positions right, but if you are interested in the features that require atomic precision, like understanding the fine details of catalysis, AlphaFold2 may not be able to match such requirements.**

## **Measuring accuracy using RMSD**

Structural biologists have extensively analysed the match between AlphaFold2 structure predictions and experimentally-derived protein structures. The AlphaFold-experiment match can be compared to the match between different experimental structures for the same protein, the latter serving as a baseline.

To compare predicted and experimental structures, researchers use the root mean square deviation (RMSD). This is a measure of the average distance (or deviation) between corresponding atoms when two similar structures are superimposed. A smaller RMSD means a better match. Two identical structures would have an RMSD of 0 Ångströms (Å). An RMSD bigger than 2-3 Å suggests that the structures are substantially different.

The median RMSD between different experimental structures of the same protein is 0.6 Å, while it is 1 Å for the AlphaFold models and experimental structures. This is a very good match and indicates that the overall folds predicted by AlphaFold2 are usually correct.

Furthermore, for high-confidence parts of the AlphaFold structure predictions (explained later in [“Inputs and Outputs”](https://www.ebi.ac.uk/training/online/courses/alphafold/inputs-and-outputs/)), the median RMSD is 0.6 Å: on par with the experimental structures. However, for low-confidence parts it may go up to 2 Å and higher. This means low-confidence regions of AlphaFold2 structure predictions may deviate substantially from the experimental structures ([Terwilliger et al., 2023](https://doi.org/10.1038/s41592-023-02087-4)).

Of the side chains predicted by AlphaFold2, 7% are not compatible with the experimental data. Nevertheless, 93% of the side chains are roughly correct, and 80% show a perfect fit. Analogous data for the experimental structures gives 98% of the side chains being roughly correct and 94% being perfect fit ([Terwilliger et al., 2023](https://doi.org/10.1038/s41592-023-02087-4)). Overall, AlphaFold2 gets the vast majority of the side chains right, but is marginally less reliable than experimental structures. Please note that this statistic can’t be extended to the disordered protein segments and parts of the structure modelled with low confidence. Conformations of amino acid side chains in the disordered and low-confidence regions are mostly random.












##### Figure 11. Phenylalanine hydroxylase

While overall structural alignment is evident, several side chains (the smaller, branching structures extending from the main protein backbone) in the AlphaFold model ([AF-Q818B4-F1](https://alphafold.ebi.ac.uk/entry/Q818B4)) are positioned incorrectly compared to those in the deposited model (grey, PDB ID: [7VGM](https://doi.org/10.2210/pdb7VGM/pdb))

Low-confidence regions of a predicted structure often correspond to intrinsically-disordered regions. However, sometimes it may indicate that AlphaFold2 doesn’t have enough information to confidently predict this structure.

An issue arises when predicting the structures of proteins that contain several domains connected by flexible linkers. Such domains likely don’t have well-defined relative positions, even in cells, or they may only adopt well-defined positions in the context of a large protein-protein complex. In these instances, AlphaFold2 will predict the structures of the individual domains accurately and confidently, but the relative positions of the domains will be essentially random – mirroring their behaviour in real life. This will be reflected in poor scores on another confidence metric called predicted aligned error (PAE) (see section “[Inputs and Outputs](https://www.ebi.ac.uk/training/online/courses/alphafold/inputs-and-outputs/)“). It would be unwise to draw any biological conclusions from the predicted relative positions of such domains.

This is especially true for membrane proteins: AlphaFold2 is not aware of the membrane plane, so it may assign domains to positions that in reality would clash with the membrane. Again, uncertainty in the orientations of the domains is usually reflected in the PAE when visualised as a plot.
