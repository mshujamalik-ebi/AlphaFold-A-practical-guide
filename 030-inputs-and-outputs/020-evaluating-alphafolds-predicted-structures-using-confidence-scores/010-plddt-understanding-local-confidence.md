---
layout: default
title: 'pLDDT: Understanding local confidence'
---

# pLDDT: Understanding local confidence

The predicted local distance difference test (pLDDT) is a per-residue measure of local confidence. It is scaled from 0 to 100, with higher scores indicating higher confidence and usually a more accurate prediction.

pLDDT measures confidence in the local structure, estimating how well the prediction would agree with an experimental structure. It is based on the local distance difference test Cα ([lDDT-Cα](https://academic.oup.com/bioinformatics/article/29/21/2722/195896?login=true)), which is a score that does not rely on superposition but assesses the correctness of the local distances ([Mariani et al., 2013](https://doi.org/10.1093/bioinformatics/btt473)).

On this basis, a pLDDT above 90 would be taken as the highest accuracy category, in which both the backbone and side chains are typically predicted with high accuracy. In contrast, a pLDDT above 70 usually corresponds to a correct backbone prediction with misplacement of some side chains.

The pLDDT score can vary significantly along a protein chain. This means AlphaFold2 can be very confident in the structure of some parts of the protein, but less confident in other regions. This gives users an indication of which parts of the predicted structure may be reliable and which are unlikely to be ([Guo et al., 2022](https://doi.org/10.1038/s41598-022-14382-9)).

![](https://ftp.ebi.ac.uk/pub/training/2024/On-demand/pLDDT_fixed.gif)


Figure 14. Sample pLDDT (predicted Local Distance Difference Test) for a predicted protein structure. Different colours indicate AlphaFold2’s level of confidence in its prediction (see key).

There are two classes of reasons why AlphaFold2 will assign a low confidence to a region of a protein. It may be that that region is naturally highly flexible or intrinsically disordered, in which case it does not have any well-defined structure. Alternatively, the region may have a predictable structure but AlphaFold2 does not have enough information to predict it with confidence. Both scenarios will typically give rise to a pLDDT below 50.

Notably, AlphaFold2 may be very confident in the structure of a globular domain of a protein, but less confident in the structure of the linkers between domains. This is because AlphaFold2 has more information to work with when predicting the structure of globular domains. These domains are typically conserved, i.e. they have changed less over evolutionary time. In contrast, linkers are more likely to be naturally variable, less structured and more flexible. There is no way to predict specific structures for such naturally-unstructured regions, so AlphaFold2 assigns its predictions a low confidence.

Most intrinsically disordered regions (IDRs) are always disordered. However, there are some IDRs where the protein lacks a defined structure under physiological conditions in its unbound state, but undergoes binding-induced folding upon interacting with its native macromolecular partner. In these uncommon instances, AlphaFold2 shows a tendency to predict the folded state with high pLDDT scores ([Alderson et al., 2023](https://doi.org/10.1073/pnas.2304302120); [Piovesan et al., 2022](https://doi.org/10.1002/pro.4466)).

One such example is eukaryotic translation initiation factor 4E-binding protein 2 (4E-BP2, UniProt ID: [Q13542](https://www.uniprot.org/uniprotkb/Q13542/entry)). AlphaFold2 predicts a helical structure with high confidence: in nature, 4E-BP2 only adopts this structure in its bound state (PDB ID: [3AM7](https://www.wwpdb.org/pdb?id=pdb_00003am7)). Note that the bound structure was included in AlphaFold2’s training set, so the program had previously seen it.












##### Eukaryotic translation initiation factor 4E-binding protein 2 (Uniprot ID: [Q13542](https://www.uniprot.org/uniprotkb/Q13542/entry))

AlphaFold predicts a helical conformation for 4E-BP2 ([AF-Q13542-F1](https://alphafold.ebi.ac.uk/entry/Q13542)) which closely resembles the bound state (PDB ID: [3AM7](https://www.wwpdb.org/pdb?id=pdb_00003am7), purple)

A similar behaviour occurs in IDRs that go through conformational changes due to post-translational modifications. In such instances, AlphaFold2 leans toward predicting the conditionally-folded state.

Finally, it is essential to understand that a high pLDDT score for all domains of a protein does not necessarily mean that AlphaFold2 is confident in the relative positions or orientations of those domains. pLDDT does not measure confidence at such large scales, so a different metric is required.

---

## Test your knowledge

Here’s a short exercise to help you evaluate predicted protein structures based on their pLDDT scores. Let’s see how well you can interpret these scores and make informed decisions about model reliability.

Which structure has the best pLDDT score?






Protein Viewer



##### C-type lectin-like domain family ([AF-Q8IZS7-F1](https://alphafold.ebi.ac.uk/entry/Q8IZS7))

May function in mediating immune cell-cell interactions

##### Apical membrane antigen 1 ([AF-Q3S2X4-F1](https://alphafold.ebi.ac.uk/entry/Q3S2X4))

Involved in parasite invasion of erythrocytes

##### Chloramphenicol acetyltransferase ([AF-P36883-F1](https://alphafold.ebi.ac.uk/entry/P36883))

Responsible for resistance to the antibiotic chloramphenicol

Very high (pLDDT > 90)

Confident (90 > pLDDT > 70)

Low (70 > pLDDT > 50)

Very low (pLDDT < 50)

### Check your answers
