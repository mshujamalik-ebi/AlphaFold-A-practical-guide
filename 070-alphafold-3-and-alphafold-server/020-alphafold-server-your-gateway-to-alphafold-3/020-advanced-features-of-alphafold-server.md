---
layout: default
title: 'Advanced features of AlphaFold Server'
---

# Advanced features of AlphaFold Server

AlphaFold Server was primarily designed as an easy-to-use tool. The aim is to unlock biomolecule modelling for biologists, including those with no experience with computational methods.

However, AlphaFold Server does provide additional options and automation possibilities for more advanced users.

## JSON job submission

You can specify an AlphaFold Server job using a JSON file, rather than the standard visual web interface. This could be used to automatically generate jobs, for example for computational screening of protein-protein interactions.

You may import multiple draft jobs by uploading JSON files with up to 100 jobs per file. However, please note that you are only allowed up to 500 saved drafts in your History.

To create a JSON file, please refer to this [documentation and examples](https://github.com/google-deepmind/alphafold/blob/main/server/README.md). However, you don’t need to start from scratch. Inside each zip file with modelling results, downloaded from the AlphaFold Server, you’ll find a JSON file named **fold\_<job\_name>\_job\_request.json.** This contains all the job inputs that were specified through the web interface. These files offer a convenient starting point for generating new jobs: they are easily editable in standard text editors, or in a programming system like Google Colab notebooks.

Once your JSON file is prepared, click the ‘Upload JSON’ button to upload it. Imported jobs will appear as saved drafts in your job history and you can click on your jobs to further edit or run them. Please note that running jobs specified through JSON files will use your job quota in exactly the same way as normal jobs specified through the web interface.

![](http://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2025/06/Screenshot-2025-06-24-at-17.10.52.png)

Figure 43. A screenshot to show the window dialogue for uploading JSON inputs.

## Sampling multiple seeds

Compared to older systems, AlphaFold 3 often produces more accurate structural predictions for such difficult targets as antigen-antibody complexes. However, achieving the highest accuracy often requires extensive sampling of the latent space, i.e. generation and subsequent ranking of numerous predictions using different random seeds. In such cases, we have seen predictions improve even up to 1,000 seeds. However, 20 seeds is usually enough to get a prediction of reasonable confidence and accuracy.

Currently, AlphaFold Server runs just one seed for each job. If you want to sample multiple seeds, you must run multiple identical jobs and compare their confidence scores (like overall pTM/ipTM) to choose the best one. This is easily done using job cloning.

Select the “Clone and reuse” option in the vertical ellipsis menu of a job in History to bring it to the job editor, then submit the job as many times as you wish without making any changes. Please make sure that the seed option in the “Confirm and submit job” dialogue is set to “Auto”. Alternatively, if you choose to specify the seeds manually, set different seeds for each repeat of the job.

![](http://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2025/06/Screenshot-2025-06-25-at-18.29.22.png)

Figure 46. The “Confirm and submit job” dialogue, where you can edit the seed value. The recommended default option is to use auto-generated random seeds, as shown here.

## Reproducing jobs

In scientific research it is often important to reproduce previously-run jobs or jobs run by someone else, including published results. You can easily do this on AlphaFold Server.

Running the model with the same seed and identical input will result in identical or highly similar predicted structures.

The exact seed value for the reproduced job is displayed on the Results page and is also saved in the **fold\_<job\_name>\_job\_request.json** file (available in the zip file for download). Similarly, if you want to enable others to reproduce your modelling results, the easiest way is to share the **fold\_<job\_name>\_job\_request.json** file:  it contains all the information required for the reproduction and can be directly submitted to AlphaFold Server via the ‘Upload JSON’ button.

![](http://www.ebi.ac.uk/training/online/courses/alphafold/wp-content/uploads/sites/259/2025/06/Screenshot-2025-06-25-at-18.33.38.png)

Figure 44. A sample results page on the AlphaFold Server
