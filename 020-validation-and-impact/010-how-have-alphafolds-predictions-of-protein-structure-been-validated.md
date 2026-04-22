---
layout: default
title: How have AlphaFold2’s predictions of protein structure been validated?
---

# How have AlphaFold2’s predictions of protein structure been validated?

**AlphaFold2’s capability to predict protein structure was first demonstrated when it triumphed in the CASP14 assessment of structure predictions. Since then it has been validated by multiple lines of evidence from structural biology experiments, including studies of X-ray crystallography, cryogenic electron microscopy and cross-linking mass spectrometry.**

## **AlphaFold’s success in CASP**

Critical Assessment of Structure Prediction ([CASP](https://predictioncenter.org/index.cgi)) is an experimental test of protein structure predictions. It has been carried out every two years since 1994. The assessment is open to anyone.

CASP entrants submit predicted structures for proteins. The proteins in question have their structures determined by experiment, by X-ray crystallography, nuclear magnetic resonance (NMR), or cryogenic electron microscopy (cryo-EM). However, these structures are not released to the public until assessment is over. Predicted structures are then compared against these experimental structures.

Google DeepMind entered structure predictions from AlphaFold2 into [CASP14](https://predictioncenter.org/casp14/index.cgi) in 2020. The software outperformed all the other entrants by a wide margin.

![](https://ftp.ebi.ac.uk/pub/training/2024/On-demand/AF_CASP14.gif)

Figure 7. The ten highest scoring entries into CASP14 in 2020, based on their cumulative scores across all proteins attempted. AlphaFold2 was by far the most successful.

Previously, overall structure prediction accuracy, measured by global distance from ground truth (GDT\_TS), had only reached about 60. AlphaFold2 scored over 90. This score meant the predicted protein structures closely matched the experimentally-resolved structures. CASP coordinators proclaimed that the protein-folding problem had been “largely solved”, at least for single protein chains.

Google DeepMind previously entered an earlier version of AlphaFold in 2018’s [CASP13](https://predictioncenter.org/casp13/). It took the first place but by a small margin. Those predictions were not accurate enough, so the protein structure prediction problem was not considered solved.

![](https://lh7-us.googleusercontent.com/_BkbLSDY5zMIDo4Sza-QXz24DxJ7WHwcmFpm_xOIZIZGuTEiO_ZkgGicn-aIDErGAOlOeFLMELERcPRyamc_SkckEwF1p0jGOkHGcQ8AAoMkjjrRVS56eOWtlmjwsE_os6G-ITrsyU7WVHXAr7SiNbs)

Figure 8. Overall success at protein structure prediction in CASPs over the years. AlphaFold drove rapid improvements in 2018 and 2020.

Google DeepMind did not directly participate in [CASP15](https://predictioncenter.org/casp15/index.cgi) in 2022. However, all the top performers used modified or customised versions of AlphaFold2. Because Google DeepMind released the source code for AlphaFold, other researchers were able to build on it and in some cases outperform the standard version of the software ([Elofsson, 2023](https://doi.org/10.1016/j.sbi.2023.102594); [Kryshtafovych et al., 2023](https://onlinelibrary.wiley.com/doi/10.1002/prot.26617)).

![](https://lh7-us.googleusercontent.com/PfuIC2A8rK2wOrPVEnVhJT_2Kp3KHg3QTk20KXc-PdhDfpthIjM_NdTB1yElVEHaGOEYD9HU8KqopwW_8Zj-C9MEaAauhWBbIgS-WBmsrqRL6zRIKlWG1nIgCkLkugfJvCoB1So2FQp_iJTkRMFzK6g)

## **Subsequent evidence from structural biology**

In CASP14, AlphaFold2 succeeded in predicting the structures of dozens of proteins. However, there are millions of proteins in nature. Hence subsequent experimenters have subjected the software to further validation.

Structural biology experiments demonstrate that AlphaFold2 structures (or well-defined parts of the predicted structures, like protein domains) work well as search models for molecular replacement in X-ray crystallography ([Barbarin-Bocahu and Graille, 2022](https://doi.org/10.1107/S2059798322002157); [McCoy et al., 2022](https://doi.org/10.1107/S2059798321012122); [Millán et al., 2021](https://doi.org/10.1002/prot.26214)). This implies the AlphaFold2 structures closely resemble the protein crystal structures.

AlphaFold2 structures fit well into experimental cryo-EM electron density maps ([Chojnowski, 2022](https://doi.org/10.1107/s2059798322005009); [Giri et al., 2023](https://doi.org/10.1016/j.sbi.2023.102536)). This again suggests a good match between structure predictions and the experimental data.

AlphaFold2 structures are still a good fit when proteins are in solution, as opposed to crystallised. Using AlphaFold2 models to interpret nuclear magnetic resonance (NMR) data obtained in solution suggested an excellent fit in the vast majority of the cases ([Fowler and Williamson, 2022](https://doi.org/10.1016/j.str.2022.04.005); [Tejero et al., 2022](https://doi.org/10.3389/fmolb.2022.877000)). Interestingly, this indicates that AlphaFold2 models are not that biassed towards predicting a crystal state, despite AlphaFold2 mainly having been trained on data derived from protein crystals.












##### Figure 10. Specialized acyl carrier protein protein

Notably, AlphaFold’s prediction (AlphaFold ID: [AF-Q6N882-F1](https://alphafold.ebi.ac.uk/entry/Q6N882)) demonstrates a closer match to the NMR structure (green, PDB ID: [2LPK](https://doi.org/10.2210/pdb2lpk/pdb)) than the corresponding X-ray crystal structure (grey, PDB ID: [3LMO](https://doi.org/10.2210/pdb3lmo/pdb)) ([Tejero et al., 2022](https://doi.org/10.3389/fmolb.2022.877000))

Cross-linking mass-spectrometry experiments showed that the majority of AlphaFold2 structure predictions were correct for both single protein chains and protein-protein complexes *in situ* ([Bartolec et al., 2023](https://doi.org/10.1073/pnas.2219418120); [McCafferty et al., 2023](https://doi.org/10.1038/s42003-023-04773-7)).

Taken together, these data validate AlphaFold2’s accuracy. They also suggest that AlphaFold2 models can be useful for a variety of research applications.
