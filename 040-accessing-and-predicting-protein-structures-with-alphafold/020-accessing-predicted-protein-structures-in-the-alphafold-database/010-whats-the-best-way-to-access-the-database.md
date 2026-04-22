---
layout: default
title: 'What’s the best way to access the database?'
---

# What’s the best way to access the database?

Users can access the predicted structures and their associated confidence metrics from AFDB through four distinct channels: directly from the AFDB web page, via FTP, Google Cloud Public Data, or via Programmatic Access (API).

![](https://ftp.ebi.ac.uk/pub/training/2024/On-demand/four_ways_to_access.gif)


Figure 23. Four ways to access predicted protein structures in the AFDB. Clockwise from top left: website, API, BigQuery, FTP download.

* If you only need to access AFDB occasionally, using the website may be the best option. The site is easy to use and does not require any coding experience.
* If you need to download big datasets, such as proteomes, [FTP](https://ftp.ebi.ac.uk/pub/databases/alphafold/) is likely to be your best option as it offers scalability.
* If you need to customise the way you access the AFDB, it may be better to use Google Big Query or the [API](https://alphafold.ebi.ac.uk/api-docs). These approaches offer more flexibility and scalability.
* If you need to download the entire collection, you can do so using the [Google Cloud Public Data](https://console.cloud.google.com/marketplace/product/bigquery-public-data/deepmind-alphafold?hl=en-GB).

## **When is the AlphaFold Protein Structure Database not an option?**

Despite the scale of the AFDB, there are some cases where it may be necessary to use the AlphaFold2 algorithm to predict the structure of a protein. These situations include:

* The protein of interest is outside the range of lengths included in the database. The minimum length is 16 amino acids. The maximum is 2,700 for proteomes and Swiss-Prot (reviewed entries) and 1,280 for the rest of UniProt. For the human proteome only, and only via FTP, the download includes longer proteins segmented into fragments.
* You are interested in oligomers or protein-protein complexes. The database only includes structures of monomers, so you would need to run modelling yourself.
* The protein sequence has been added to, or otherwise modified, by UniProt in a more recent release.
* The protein of interest is known to have multiple conformations. The database will only have one predicted structure per protein, so by definition does not provide information about different conformational states.
* The protein of interest comes from a virus. The database does not include viral proteins.
* You need control over the prediction parameters. In particular, the database does not archive MSAs.

We have created a table summarising the different ways to access the AlphaFold Protein Structure Database (AFDB).

|  | **Feature** |
| --- | --- |
| **Web Pages** | * Search can be done based on protein name, gene name, UniProt accession, organism name, and amino acid sequence * Users can filter results based on species and/or review status (Swiss-Prot) to effectively identify proteins of interest. * Structures are hosted in individual web pages. Structure pages show basic information about the protein (retrieved from UniProt), and three separate outputs from AlphaFold. * Predicted structures are visualized using [Mol\*](https://molstar.org/) and colored based on pLDDT. Visualization includes a sequence viewer. * The Predicted Aligned Error (PAE) can be inspected using the 2D plot by clicking and dragging. Users can highlight sections of interest on the structure. |
| **API** | * Allows users to access the AFDB in a flexible, scalable and reliable way. * Powerful tool that can be used to integrate tasks into other applications and workflows. These include searching and downloading protein structures, and creating advanced queries like filtering entries based on criteria such as pLDDT score. * Can be complex to use, especially if you are not familiar with programming. It is important to carefully read the API documentation and to understand the different query parameters that are available. * Queries can take a long time to complete, especially if the user is requesting a large amount of data. |
| **FTP** | * Well-established protocol that is very reliable for transferring large amounts of data. Best option for downloading large datasets, such as all proteins from a particular organism. * No need to code: can be accessed through [EMBL-EBI’s FTP area](https://ftp.ebi.ac.uk/pub/databases/alphafold) * Users can access previous versions of the database. We keep a record of all notable changes made to the database, organised chronologically, with the most recent changes listed first. These are stored in the [CHANGELOG](https://ftp.ebi.ac.uk/pub/databases/alphafold/CHANGELOG.txt). * As of September 2023, EMBL-EBI’s FTP area hosts the proteomes of 48 organisms in TAR files, containing all the available compressed PDB and mmCIF files for each proteome. PAE is not included in FTP downloads. * Reviewed files (Swiss-Prot) can be downloaded as PDB or mmCIF formats. * Large proteins can be accessed as fragments. * Visit the [Download](https://alphafold.ebi.ac.uk/download) tab for more information. |
| **Big Query** | * The AlphaFold Database is hosted on [Google Cloud Public Datasets](https://console.cloud.google.com/marketplace/product/bigquery-public-data/deepmind-alphafold?hl=en-GB). * It can be downloaded at no cost, under a CC-BY-4.0 license. * To access it through BigQuery, you will need a Google Cloud account and some basic knowledge of [SQL queries](https://cloud.google.com/bigquery/docs/reference/standard-sql/query-syntax). * On the free tier, [Big Query](https://cloud.google.com/bigquery?utm_source=google&utm_medium=cpc&utm_campaign=na-US-all-en-dr-bkws-all-all-trial-e-dr-1655212&utm_content=text-ad-none-any-DEV_c-CRE_665665924755-ADGP_Hybrid+%7C+BKWS+-+MIX+%7C+Txt_BigQuery-KWID_4375px5px5px78974141321-kwd-63326445px124&utm_term=KW_google+bigquery-ST_google+bigquery&gad_source=1&gclid=CjwKCAiAhJWsBhAaEiwAmrNyq7cdt8zcT4tGP1haU5pxti1hJpHAyW8q-WupPk1Trtf_PIawriiIx7gRoCyW8QAvD_BwE&gclsrc=aw.ds&hl=en) offers a limited amount of queries per month. It is the user’s responsibility to keep track of the resource usage. * For more information on how to access through BigQuery, [visit the AlphaFold GitHub](https://github.com/google-deepmind/alphafold/blob/main/afdb/README.md#bigquery). |

---

## How to access through API, FTP and Big Query

In this section, we will guide you through accessing the AlphaFold Protein Structure Database through API and BigQuery.
