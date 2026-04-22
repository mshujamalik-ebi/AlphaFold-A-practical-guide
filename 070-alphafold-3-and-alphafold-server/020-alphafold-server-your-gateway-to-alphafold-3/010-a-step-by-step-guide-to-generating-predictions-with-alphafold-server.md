---
layout: default
title: 'A step-by-step guide to generating predictions with AlphaFold Server'
---

# A step-by-step guide to generating predictions with AlphaFold Server

AlphaFold Server was designed for simple and intuitive use. For a simple introduction to the workflow, please see the video below.

AlphaFold Server Demo

It is easy and straightforward to specify AlphaFold Server inputs:

* For a protein, enter the single-letter amino acid sequence. Alternatively, paste in the contents of a FASTA file. If you have multiple proteins, you can put all their sequences into one FASTA file (see below). Use only standard single-letter codes. Nonstandard codes like B, J, O, U, X and Z are not supported.
* For DNA, enter the single-letter nucleotide sequence in standard notation (5’-3’). Use only standard single-letter codes, i.e. A, C, G and T.
* For RNA, similarly enter the single-letter nucleotide sequence in standard notation (5’-3’). Use only standard single-letter codes, i.e. A, C, G and U.
* For ligands, ions, and post-translational modifications, select the desired entity from the list. The three-letter codes displayed in the interface come from the Worldwide Protein Data Bank’s [Chemical Component Dictionary (CCD)](https://www.wwpdb.org/data/ccd).

## Adding complexes

If multiple copies of an entity are present (for example, a homomultimeric protein), indicate this by setting the number of copies in the corresponding field.

If you are modelling a large complex, you will need to fill in multiple sequences. To do this quickly, paste in the contents of a FASTA file. Simply open a FASTA file containing your sequences in any text editor, copy the entire contents and paste it into AlphaFold Server’s text input box. The Server will recognise the FASTA format and fill in multiple entities automatically. It will also recognise protein, DNA and RNA sequences and assign the correct entity type.

The vertical ellipsis (three-dot) menu ⋮ at the right-hand side of every entity allows several different options, depending on the entity type.

## Adding modifications

For proteins, you can add post-translational modifications (PTMs). Selecting the “+ PTMs” option will open a dialogue window displaying the sequence of the protein chain. Click a residue to which you wish to add a PTM and choose a supported modification from the list that appears. You can add multiple modifications to different residues one at a time. Once finished, save the modifications via the corresponding button.

Please note, once you add a PTM and save it, you can’t edit the protein sequence. For detailed information on modelling protein glycosylation, see the [AlphaFold Server FAQ](https://alphafoldserver.com/faq#can-i-model-glycosylated-proteins).

![](http://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2025/06/Screenshot-2025-06-25-at-17.55.28.png)

Figure 41. A screenshot showing the window for adding post-translational modifications.

For DNA and RNA chains, you can add chemical modifications to the corresponding nucleotides. The procedure works exactly as described above for proteins.

AlphaFold Server treats “DNA” and “RNA” entities as single strands. This facilitates adding chemical modifications, as the modifications to double-stranded DNA could be different for the two complementary strands.

To model double-stranded DNA, add the first DNA entity and fill in the sequence, either by copy-and-paste or by typing it in. Then select the “+ Reverse complement” option from the vertical ellipsis menu to add the complementary strand; it will be added as a separate DNA entity.

![](http://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2025/06/Screenshot-2025-06-24-at-16.53.32.png)

Figure 42. A screenshot showing the input interface for defining a DNA entity, including options to specify sequence, add modifications, or generate the reverse complement.

It is possible to change the order of the entities. Simply drag the entities using the grey two-by-three dots ⋮⋮ to their left until you get the correct order. AlphaFold Server normally sticks to your input order, so you should find the entities in the same order in the modelled structure and output mmCIF files. However, there is one exception: the mmCIF standard dictates that ligands and ions must be listed last, so AlphaFold Server may reorder the inputs to put them last.

To clear all inputs, just use the “Clear” button on the top right.

It is possible to save draft jobs and modify or run them later. If you press the “Save job” button, the system will ask you for the job name and will save it. Saved jobs are displayed in History alongside running and finished jobs, and are marked by the corresponding icon. For easier access, you can click categories on the top of the History list to filter for certain types of jobs, e.g. “Completed” or “Saved draft”. Saving the job might be useful if you use up your daily jobs quota: you can save several jobs and run them the next day once the jobs allocation is renewed.

## Job submission

After you have prepared all the inputs, press the “Continue and preview job” button. The dialogue allows you to specify a meaningful job name; if you don’t, the current date and time will be used. You can also switch between an automatically- and manually-defined seed value for this job (for more information on seeds, see Advanced features of AlphaFold Server and corresponding [FAQ section](https://alphafoldserver.com/faq#what-are-seeds-and-how-are-they-set)).

Check that all inputs are correct. You may also want to note the number of remaining jobs for better planning of your modelling efforts. Finally, press “Confirm and submit job”. The number of remaining jobs will decrease by one and the job will appear in the History list as a job in progress.

![](http://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2025/06/Screenshot-2025-06-25-at-18.13.35.png)

Figure 43. The History list, showing multiple jobs on the AlphaFold Server. The top one is running, the others have finished.
.

## Results

Normally, a job will finish in several minutes. For example, it usually takes 3-6 minutes to predict a structure with 1,000 tokens and 6-8 minutes to predict a structure with 3,600 tokens. However, heavy Server loads may cause delays. When a job has finished, its icon changes and you can double-click it to see the results.

The vertical ellipsis menu ⋮ to the right of every job in the History allows you to:

* Delete the job from the list
* Rename the job
* For finished jobs, open the results page or download the predicted structures
* “Clone and reuse” the job. This will bring all its inputs back into the job creation interface: you can then re-run the job as is, or edit it and re-run with modifications (creating a new job in the process). This is useful if you are generating a series of similar structure predictions, for example, the same protein with different DNAs.

Extremely rarely (less than 0.1% of overall job submissions), modelling jobs may fail. Failed jobs will be marked with a specific icon and clicking the job will display the exact error. Re-submitting a job will often help if the reason for failure is technical. One possible reason for a job to fail is if the submitted sequence is highly similar to a sequence from a viral pathogen that has been placed on the restricted list (for more details see [AlphaFold Server FAQ](https://alphafoldserver.com/faq#are-there-any-restrictions-on-the-protein-sequences-that-are-allowed)).

Once the job is finished, clicking on its row will get you to the results page. The results page displays:

* Backbone visualisation of the structure, coloured by pLDDT scores
* PAE plot
* Overall pTM score
* Overall ipTM score if the structure is a complex (for more on these confidence metrics, see subsection “[Interpreting results from AlphaFold Server](https://www.ebi.ac.uk/training/online/courses/alphafold/interpreting-results-from-alphafold-server/)“)
* Information about the job’s inputs, including the value of the random seed
* “Download” and “Clone and reuse” buttons
* A link to provide feedback on the structure

![](http://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2025/06/Screenshot-2025-06-24-at-17.06.35.png)

Figure 44. A sample results page on the AlphaFold Server

You can download all modelling results in a single zip file. It contains atomic coordinates of the predicted structures in the mmCIF format and additional information about confidence scores in the JSON files (for more details on the outputs, see [Interpreting results from AlphaFold Server](https://www.ebi.ac.uk/training/online/courses/alphafold/interpreting-results-from-alphafold-server/)).
