# IR2022-Project

Creating a medical ranking system with medical BERT. 

1. Basis pyserini with BM25
2. Rerank with Medical Bert (https://huggingface.co/emilyalsentzer/Bio_ClinicalBERT?text=My+headache+is+caused+by+%5BMASK%5D.)
3. Applying this model to TREC Covid (https://ir.nist.gov/trec-covid/data.html) & TREC Medical (https://trec.nist.gov/data/clinical2016.html). 

First idea: 
1. Use bert-large-msmarco-pretrained_only.zip from https://github.com/castorini/duobert, as a starting point. 
2. Fine-tune mono-BERT on TREC_COVID
3. Fine_tune duo_BERT on TREC_COVID

Question for Koen:
1. How to deal with the huge dataset (TREC-COVID (12GB) & TREC Medical (~60GB) -> One of the four parts maybe, and how do we still split it then. 
2. Would this be reconsidered worth-while to reuse their model, or can we only take inspiration from it or just implement a mono-BERT or duo-BERT for reranking ourselfs. 
