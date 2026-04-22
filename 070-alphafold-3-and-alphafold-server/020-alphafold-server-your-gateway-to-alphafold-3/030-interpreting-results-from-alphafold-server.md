---
layout: default
title: 'Interpreting results from AlphaFold Server'
---

# Interpreting results from AlphaFold Server

**Alongside predicted structures, AlphaFold 3 supplies a range of confidence metrics, enabling you to assess the accuracy of the predictions. The confidence metrics are similar to those used by AlphaFold 2.**

However, because AlphaFold 3 predicts the structures of multimolecular complexes, there are additional factors to consider. AlphaFold 3 is not intended for, validated for, or approved for clinical use.

## **Outputs provided by AlphaFold Server**

AlphaFold Server produces five predictions per job. (Technically, five diffusion samples per seed, but currently each job runs one seed.)

The top-ranked prediction is displayed on the results page. Predicted structures are ranked using the *ranking\_score* metric. This uses two measures of confidence in overall structure (pTM and ipTM), but also includes terms that penalise clashes and encourage disordered regions not to have spurious helices. These extra terms mean *ranking\_score* should only be used to rank structures.

All five samples, along with their associated confidences, are available to download as a zip file. This contains:

* Five .cif files named **fold\_<job\_name>\_model\_<N>cif**, where “<N>” is the rank of the predicted structure. Structures are ranked from 0 to 4, where 0 has the highest confidence. The .cif files contain predicted structures in the mmCIF format. They can be viewed in any molecular viewer like PyMOL or ChimeraX.
* Five .json files named **fold\_<job\_name>\_summary\_confidences\_<N>.json**, where “<N>” is the rank of the predicted structure from 0 to 4. These .json files contain summaries of the confidence metrics for the predictions (see below for more details on confidence metrics).
* Five .json files named **fold\_<job\_name>\_full\_data\_<N>.json**, where “<N>” is the rank of the predicted structure from 0 to 4. These .json files contain detailed confidence metrics, such as full PAE data, for the predictions (see below for more on confidence metrics).
* A file named **fold\_<job\_name>\_job\_request.json**. This contains the inputs of the modelling job and could be used to re-run the job (for more details, see “[Advanced use of AlphaFold Server](https://www.ebi.ac.uk/training/online/courses/alphafold/advanced-features-of-alphafold-server/)“).
* A file named **terms\_of\_use.md**. This is a legal document detailing the terms of use for the predictions.

JSON is a text-based format, so it is both human- and machine-readable. You can check JSON files with any text editor, or use a programming system like Python to read and visualise outputs.

```
{
 "chain_iptm": [
  0.85,
  0.86,
  0.59,
  0.59
 ],
 "chain_pair_iptm": [
  [
   0.82,
   0.9,
   0.83,
   0.83
  ],
  [
   0.9,
   0.82,
   0.83,
   0.84
  ],
  [
   0.83,
   0.83,
   0.03,
   0.1
  ],
  [
   0.83,
   0.84,
   0.1,
   0.03
  ]
 ],
 "chain_pair_pae_min": [
  [
   0.76,
   0.79,
   1.0,
   1.12
  ],
  [
   0.79,
   0.76,
   1.11,
   1.0
  ],
  [
   0.98,
   1.06,
   0.78,
   0.92
  ],
  [
   1.05,
   0.97,
   0.92,
   0.78
  ]
 ],
 "chain_ptm": [
  0.82,
  0.82,
  0.03,
  0.03
 ],
 "fraction_disordered": 0.18,
 "has_clash": 0.0,
 "iptm": 0.91,
 "num_recycles": 10.0,
 "ptm": 0.91,
 "ranking_score": 1.0
}
```

An example of the contents of a fold\_\_summary\_confidences\_.json file, showing multiple confidence metrics.

## **Confidence metrics**

Some of the metrics in the JSON files are very straightforward: for instance, the “ptm” record contains the overall pTM score. However, some other metrics are more targeted at advanced users. Full explanations of the confidence metrics are provided in subsequent sections.

JSON files with summary outputs contain the following information:

* ***chain\_iptm*:** A [num\_chains] array that gives the average confidence (ipTM) in the interfaces between each chain and all other chains. This can be used for ranking predicted structures for a specific chain, when you care about where the chain binds to the rest of the complex and you do not know which other chains you expect it to interact with. This is often the case with ligands, each of which the system treats as a separate chain.
* ***chain\_pair\_iptm*:** A square [num\_chains, num\_chains] array representing pairwise ipTM scores. The off-diagonal element (i, j) of the array contains the ipTM restricted to tokens from chains i and j. The diagonal element (i, i) contains the pTM restricted to chain i. The array can be used for ranking predictions of a structure by the accuracy of a specific interface between two chains that you know interact, e.g. antibody-antigen interactions. As these values are calculated based on tokens, this metric also encompasses small molecules and chemically-modified residues and nucleotides.
* ***chain\_pair\_pae\_min***: A square [num\_chains, num\_chains] array of PAE values. Element (i, j) of the array contains the lowest PAE value across rows restricted to chain i and columns restricted to chain j. This has been found to correlate with whether or not two chains interact, so it can be used to distinguish interacting and non-interacting molecules. As these values are calculated based on tokens, this metric also encompasses small molecules and chemically-modified residues and nucleotides.
* ***c******hain\_ptm*:** A [num\_chains] array. Element i contains the pTM restricted to chain i. This can be used for ranking the predicted structures of individual chains when you are most interested in the structure of that chain, rather than its cross-chain interactions.
* ***fraction\_disordered*:** A scalar in the range 0-1 that indicates what fraction of the prediction structure is disordered, as measured by accessible surface area (see [Abramson et al., 2024](https://doi.org/10.1038/s41586-024-07487-w) for details).
* ***has\_clash*:** A Boolean, i.e. a yes/no value, indicating if the structure has a significant number of clashing atoms (more than 50% of a chain, or a chain with more than 100 clashing atoms).
* ***iptm*:** A scalar in the range 0-1 indicating predicted interface TM-score (confidence in the predicted interfaces) for all interfaces in the structure.*num\_recycles: An integer number that represents the total number of recycles.*
* ***ptm*:** A scalar in the range 0-1 indicating the predicted TM-score for the full structure.
* ***ranking\_score*****:** A scalar ranging from -100 to 1.5 that can be used for ranking predictions. It combines *ptm*, *iptm*, *fraction\_disordered* and *has\_clash* into a single number with the following equation:

0.8 × ipTM + 0.2 × pTM + 0.5 × disorder − 100 × has\_clash

JSON files with full outputs contain the following information:

* ***atom\_chain\_ids*:** A [num\_atoms] array indicating the chain IDs corresponding to each atom in the prediction.
* ***atom\_plddts*:** A [num\_atoms] array. Element i indicates the predicted local distance difference test (pLDDT) for atom i in the prediction.
* ***contact\_probs*:** A square [num\_tokens, num\_tokens] array. Element (i, j) indicates the predicted probability that token i and token j are in contact, where “in contact” is defined as a maximum distance of 8Å between a system-defined representative atom for each token (for details, see [Abramson et al., 2024](https://doi.org/10.1038/s41586-024-07487-w)).
* ***pae*:** A square [num\_tokens, num\_tokens] array. Element (i, j) indicates the predicted aligned error (PAE) in the position of token j, when the prediction is aligned to the ground truth using the frame of token i.
* ***token\_chain\_ids*:** A [num\_tokens] array indicating the chain IDs corresponding to each token in the prediction.
* **token\_res\_ids:** A [num\_res] array.

JSON files with full outputs (**fold\_<job\_name>\_full\_data\_<N>.json**) can be used with tools like the latest version of [ChimeraX](https://www.rbvi.ucsf.edu/chimerax/) or [PAE Viewer](https://subtiwiki.uni-goettingen.de/v4/paeViewerDemo). In this way, you can visualise dynamic PAE plots and match PAE data onto predicted structures stored in the **fold\_<job\_name>\_model\_<N>.cif** files.
