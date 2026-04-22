---
layout: default
title: 'Confidence scores in AlphaFold-Multimer'
---

# Confidence scores in AlphaFold-Multimer

AlphaFold-Multimer is a specialised version of the software. It is designed to predict the structures of protein complexes. AlphaFold-Multimer provides two additional metrics for evaluating the accuracy of its predictions: the predicted template modelling (pTM) score and the interface predicted template modelling (ipTM) score.

Both are derived from a measure called the template modelling (TM) score. This measures the accuracy of the global structure of the protein and is relatively insensitive to localised inaccuracies ([Xu and Zhang, 2010](https://doi.org/10.1093/bioinformatics/btq066)).

pTM is an integrated measure of how well AlphaFold-Multimer has predicted the overall structure of the complex. It is the predicted TM score for a superposition between the predicted structure and the hypothetical true structure. A TM score above 0.5 means the overall predicted fold for the complex might be similar to the true structure. A TM score below 0.5 means the predicted structure is likely wrong: pTM score follows the same definition. pTM score should be interpreted cautiously. For example, imagine a situation where one of the interacting proteins is larger, and its structure is predicted correctly, while a smaller partner protein is predicted incorrectly. The resulting pTM score of the complex could be dominated by the larger protein and show a pTM score above 0.5.

In contrast, ipTM measures the accuracy of the predicted relative positions of the subunits forming the protein-protein complex. Values higher than 0.8 represent confident high-quality predictions, while values below 0.6 suggest likely a failed prediction. ipTM values between 0.6 and 0.8 are a grey zone where predictions could be correct or wrong. These values assume modelling with multiple recycling steps, so the process of prediction reaches a degree of convergence. In large-scale screenings for protein-protein interactions, often settings optimised for the speed of prediction are used, e.g. very few or no recycling steps. In such cases ipTM thresholds as low as 0.3 have been used for initial screening; importantly though, all pairs of proteins with ipTM scores higher than 0.3 were then subjected to additional examination (e.g. [Weeratunga et al., 2023](https://doi.org/10.1101/2023.02.20.529329)). Disordered regions and regions with low pLDDT score may negatively impact the ipTM score even if the structure of the complex is predicted correctly.

ipTM may be more useful to users than pTM. This is because the quality of the prediction of the relative positions of the subunits and the quality of the whole complex prediction are highly interdependent: if the relative positions of the subunits are correct (as reflected in a high ipTM score), users can expect that the whole complex is also correct.

In practice, your overall confidence in predictions for multimers should be based on a combination of all the metrics, including both pTM and ipTM as well as pLDDT and PAE.
