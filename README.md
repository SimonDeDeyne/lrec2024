 # Using LLMs to Recover Latent Semantic Relational Information from Word Associations
 Author: Simon De Deyne
 Date: 01/03/2024

 The following repository contains data, prompt instructions and R code to accompany
 [Can GPT-4 Recover Latent Semantic Relational Information from Word Associations? A Detailed Analysis of Agreement with Human-annotated Semantic Ontologies.]() at LREC2024.

## Data and Instructions
This repository contains the preprocessed datafiles consisting of a cue word, response and semantic relation for four different datasets.
The Semantic relations follow existing semantic ontologies taken from the original study with some minor modifications.
Prompt instructions were closely modelled according to the original ontolies and are available under [./data](./data).


 ## Analysis
 The analyses are provided as a series of R notebooks, which cover [prompting](./R/prompting.Rmd) and a [report](./R/analysis.Rmd) which contains the results and figures presented in the article.
 
