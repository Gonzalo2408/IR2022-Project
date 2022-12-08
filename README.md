# IR2022-Project

Creating a medical ranking system with medical BERT. 

1. Basis pyserini with BM25
2. Rerank with Medical Bert (https://huggingface.co/emilyalsentzer/Bio_ClinicalBERT?text=My+headache+is+caused+by+%5BMASK%5D.)
3. Applying this model to TREC Covid (https://ir.nist.gov/trec-covid/data.html) & TREC Medical (https://trec.nist.gov/data/clinical2016.html). 

First idea: 
1. Use bert-large-msmarco-pretrained_only.zip from https://github.com/castorini/duobert, as a starting point. 
2. Fine-tune mono-BERT on TREC_COVID (https://github.com/nyu-dl/dl4marco-bert)
3. Fine_tune duo_BERT on TREC_COVID

Checklist:
1. Created corpus (corpus.json using create_corpus.ipynb)
2. Created toics files (train_topics_v2/test_topics_v2/dev_topics_v2.xml manually)
3. Created qrels split (train/test/dev.qrels manually)
4. Created run files (train/test/dev.run using retrieval_cord_19.ipynb)

Next: 
Convert corpus + topics + qrels + run to  TFRecords
Upload all of it to cluster


Commands for pyserini:
https://castorini.github.io/pyserini/2cr/msmarco-v1-passage.html

Going into the cluster: 
1. Open putty -> choose client -> cn99.science.ru.nl
2. Login with your science account
3. Get out of your own directory with cd/
4. TREC COVID -> cd /ceph/csedu-scratch/course/I00041_informationretrieval/shared/trec-covid

Questions for Koen:

