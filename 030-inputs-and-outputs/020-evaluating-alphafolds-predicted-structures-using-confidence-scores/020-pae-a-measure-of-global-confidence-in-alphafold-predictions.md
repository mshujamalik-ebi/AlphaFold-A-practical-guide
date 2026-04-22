---
layout: default
title: 'PAE: A measure of global confidence in AlphaFold2 predictions'
---

# PAE: A measure of global confidence in AlphaFold2 predictions

Predicted aligned error (PAE) is a measure of how confident AlphaFold2 is in the relative position of two residues within the predicted structure. PAE is defined as the expected positional error at residue X, measured in Ångströms (Å), if the predicted and actual structures were aligned on residue Y.

Therefore, PAE is effectively a measure of how confident AlphaFold2 is that the domains are well packed and that the relative placement of the domains in the predicted structure is correct.

![](https://ftp.ebi.ac.uk/pub/training/2024/On-demand/alphafold.gif)

Figure 16. A sample PAE (Predicted Aligned Error) plot, showing regions of high confidence (dark green) and low confidence (pale green) for the predicted structure of ferrous iron transport protein B (AlphaFold ID: [AF-Q12XU1-F1](https://alphafold.ebi.ac.uk/entry/Q12XU1)).

A low PAE score between two residues from two different domains means low predicted error. This in turn means AlphaFold2 is confident in the position of these residues. Conversely, a high PAE score means that AlphaFold2 is not confident in their relative position.

Ignoring the PAE score can lead to misinterpretation of the relative position of domains ([Guo et al., 2022](https://doi.org/10.1038/s41598-022-14382-9)). One example is the mediator of DNA damage checkpoint protein 1 (AlphaFold ID: [AF-Q14676-F1](https://alphafold.ebi.ac.uk/entry/Q14676)). Its two domains appear to be close together in space, but the PAE indicates that the positions of these domains are essentially random.












![Description of the image](http://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2024/01/Screenshot-2024-01-08-at-11.24.21.png)

##### Figure 17. Mediator of DNA damage checkpoint protein 1

Explore the interactive PAE (Predicted Aligned Error) visualisation directly on the AlphaFold Protein Structure Database ([AF-Q14676-F1](https://alphafold.ebi.ac.uk/entry/Q14676))

PAE can be visualised as an easy-to-interpret PAE plot. Every predicted protein structure in the AlphaFold Protein Structure Database (AFDB) is accompanied by a PAE plot. The plot is a 2D graph, with the protein residues running along the axes. In each square, the shade of green indicates the expected distance error in Ångströms (Å) for a pair of residues. A dark green tile designates a good prediction (low error), whereas a light green tile indicates poor prediction (high error).

The PAE plot will always have a dark green diagonal line running from top-left to bottom-right. This represents residues being aligned against themselves, where confidence is always high by definition, so it is not informative and can be ignored. The biologically-relevant information, in terms of relative orientations, is contained in the regions away from the diagonal.

If you are viewing the PAE plot on the AFDB, you can select a region of the plot. The AFDB will highlight the region or regions in question on the 3D structure, so you can examine the relationship between the sequence, the corresponding segment of the PAE plot and the structure.

![](https://ftp.ebi.ac.uk/pub/training/2024/On-demand/pae-plddt.gif)


---

## Test your knowledge

In this section you’ll see a series of structures for you to interpret, focusing on the Predicted Aligned Error (PAE). You can then check your interpretation of the PAE against ours. Interpret the Predicted Aligned Error (PAE) and compare your conclusions with ours. Remember that you can use the interactive PAE plot in the AlphaFold Protein Structure Database.












![Description of the image](http://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2024/01/Q9NRI5.png)

##### Disrupted in schizophrenia 1 protein ([AF-Q9NRI5-F1](https://alphafold.ebi.ac.uk/entry/Q9NRI5))

Involved in the regulation of multiple aspects of embryonic and adult neurogenesis

![Description of the image](http://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2024/01/P9WNQ7.png)

##### ESX-1 secretion system protein EccD1 ([AF-P9WNQ7-F1](https://alphafold.ebi.ac.uk/entry/P9WNQ7))

Component of the ESX-1 type VII secretion system, which actively transports various virulence factors into host cells during the course of infection

![Description of the image](http://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2024/01/O15121.png)

##### Sphingolipid delta(4)-desaturase DES1 ([AF-O15121-F1](https://alphafold.ebi.ac.uk/entry/O15121))

Has been linked to leukodystrophy. However, no structural or model information for this protein is available.

### Check your answers

---

## Integrating pLLDT and PAE scores

Although pLDDT and PAE measure confidence in different aspects of the predicted structure, in some cases they can be strongly correlated. For example, a disordered protein segment predicted with low pLDDT will probably also have a large PAE. This is because its position relative to the other parts of the protein is not well-defined. However, pLDDT does not show whether protein domains are positioned confidently relative to each other, whereas PAE shows exactly this.

PAE scores should always be interpreted in conjunction with other confidence scores like pLDDT.

![](https://ftp.ebi.ac.uk/pub/training/2024/On-demand/exportin-pae-plddt.gif)
