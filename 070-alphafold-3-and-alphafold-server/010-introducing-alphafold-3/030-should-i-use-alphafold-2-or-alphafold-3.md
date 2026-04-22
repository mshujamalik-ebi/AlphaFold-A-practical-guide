---
layout: default
title: 'Should I use AlphaFold 2 or AlphaFold 3?'
---

# Should I use AlphaFold 2 or AlphaFold 3?

In terms of functionality, AlphaFold 3 can do everything AlphaFold 2 can, and do it better. It also has additional capabilities, in particular predicting the structures of complexes containing multiple types of molecules.

However, there are differences in how each model has been made available for use. AlphaFold 2 is freely available for both academic and commercial use under the permissive Apache 2 licence terms. In contrast, AlphaFold 3 is only currently available for non-commercial use, subject to [AlphaFold Server Terms of Service](https://alphafoldserver.com/terms), or [AlphaFold Model Parameters terms of use](https://github.com/google-deepmind/alphafold3/blob/main/WEIGHTS_TERMS_OF_USE.md), which include a number of use restrictions. Consequently, for some types of projects, you must use AlphaFold 2.

Importantly, you can’t use AlphaFold 3 or its outputs in connection with any commercial activities, including research on behalf of commercial organisations, or to train machine learning models or related technology for biomolecular structure prediction similar to AlphaFold Server. You are free to use AlphaFold 2 for these purposes.

AlphaFold 3 confidence scores for polymers can be affected substantially by the inclusion (or removal) of non-polymer context, such as ions or stabilising ligands. If investigating something in a polymer-only setting (e.g. protein-protein interaction), it can be important to add non-polymer context where appropriate to improve confidence scores. Using AlphaFold 2 avoids this complexity, at the possible cost of slightly reduced structural accuracy.

Because AlphaFold 2 remains a valuable tool in many research and development scenarios, Google DeepMind will continue to support it.
