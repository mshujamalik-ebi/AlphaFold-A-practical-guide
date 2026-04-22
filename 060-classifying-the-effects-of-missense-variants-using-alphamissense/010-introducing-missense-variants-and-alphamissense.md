---
layout: default
title: 'Introducing missense variants and AlphaMissense'
---

# Introducing missense variants and AlphaMissense

Missense variants are the most common type of genetic variant. A single change in the DNA sequence results in the substitution of one amino acid for another in a protein. While some missense variants are harmless, others can lead to genetic disorders.

AlphaMissense is a machine-learning system that can categorise a missense genetic variant as likely to be pathogenic (disease-causing) or benign (limited effect). To classify missense variants, Google DeepMind has built a new tool called AlphaMissense. Google DeepMind based AlphaMissense on AlphaFold2, but implemented it as a separate system.

AlphaMissense has already provided high-confidence predictions for most human missense variants ([Cheng et al., 2023](https://doi.org/10.1126/science.adg7492)). See Disclaimer [1](https://www.ebi.ac.uk/training/online/courses/alphafold/?page_id=2721&preview=true#:~:text=1.%20Disclaimer%3A%20%E2%80%9CAlphaFold,a%20qualified%20professional.%E2%80%9D)

## **How AlphaMissense works**

To predict whether a variant is pathogenic, AlphaMissense combines two types of data.

The first is the degree to which the amino acid residue has been conserved over evolutionary history. If a residue is deeply conserved, it is likely to be important for protein function. Changes to such conserved residues are more likely to be pathogenic.

The second factor is the structural context of the variant. Depending on where an amino acid is located within a protein, it is more or less likely to be critical to function.

AlphaMissense’s training process involved analysing a vast dataset of variant frequencies in human and primate populations. Variants that were frequently observed were categorised as benign, while rare or absent variants were deemed pathogenic.

To verify that AlphaMissense successfully predicted the pathogenicity of missense variants, it was validated against multiple benchmarks. These included annotated data from ClinVar, the Evolutionary model of Variant Effect (EVE) and MAVE datasets.

![](https://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2024/11/alphamissense-1.png)


Figure 31. AlphaMissense surpasses other computational methods on predicting the effects of missense variants from ClinVar. Methods highlighted in grey were trained directly on ClinVar; this led to potentially inflated performance metrics, as some training variants are included in this set.

1. Disclaimer: “AlphaFold is a research tool and its outputs have varying levels of confidence. The information provided in these modules and by AlphaFold (including in the AlphaFold Database) is provided free of charge, strictly as-is and without representation or warranty of any kind. We are not responsible for the accuracy, reliability, availability, effectiveness, or correct use of this information or for any impact from ongoing use of such information. If you rely on any such information, you do so solely at your own risk. These modules, AlphaFold and its outputs are not intended for, have not been validated for, and are not approved for clinical use. You should not use any of this information for clinical purposes or rely on it for medical or other professional advice. Any content regarding those topics is provided for informational purposes only and is not a substitute for advice from a qualified professional.”
