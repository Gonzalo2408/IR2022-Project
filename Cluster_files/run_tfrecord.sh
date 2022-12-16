#!/usr/bin/env bash
#SBATCH --partition=csedu
#SBATCH --mem=64G
#SBATCH --cpus-per-task=4
#SBATCH --gres=gpu:4
#SBATCH --time=12:00:00
#SBATCH --output=./Output/treccord.out
#SBATCH --error=./Output/treccord.err
#SBATCH --account=cjordaan


# location of repository and data
project_dir=.. # assume sbatch is called from root project dir

python convert_treccovid_to_tfrecord.py \
  --output_folder=./Output/CDS_tfrecord \
  --vocab_file=./vocab.txt \
  --corpus=./Json_files/corpus_02_03.json \
  --qrels_train=./Qrels/qrels_train_v2.txt \
  --qrels_dev=./Qrels/qrels_dev_v2.txt \
  --qrels_test=/ceph/csedu-scratch/course/I00041_informationretrieval/shared/trec-cds-2016/qrels-treceval-2016.txt \
  --run_train=./TREC_COVID_RUN/train_1000.run \
  --run_dev=./TREC_COVID_RUN/dev.run \
  --run_test=/ceph/csedu-scratch/course/I00041_informationretrieval/group20/Cluster_files/CDS_run_files/test_cds.run \
  --max_query_length=64 \
  --max_seq_length=512 \
  --num_train_docs=1 \
  --num_dev_docs=1 \
  --num_test_docs=50