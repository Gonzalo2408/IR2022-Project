# !/usr/bin/env bash
# SBATCH --partition=csedu
# SBATCH --mem=13G
# SBATCH --cpus-per-task=3
# SBATCH --gres=gpu:1
# SBATCH --time=7:00:00
# SBATCH --output=./logs/treccar.out
# SBATCH --error=./logs/treccar.err
#SBATCH --mail-user=cjordaan
# SBATCH --mail-type=BEGIN,END,FAIL

# location of repository and data
project_dir=/ # assume sbatch is called from root project dir

python convert_treccar_to_tfrecord.py \
  --output_folder=/Output/tfrecord \
  --vocab_file=/vocab.txt \
  --corpus=/Json_files/corpus.json \
  --qrels_train=/Qrels/qrels_train_v2.txt \
  --qrels_dev=/Qrels/qrels_dev_v2.txt \
  --qrels_test=/Qrels/qrels_test_v2.txt \
  --run_train=/TREC_COVID_RUN/train.run \
  --run_dev=/TREC_COVID_RUN/dev.run \
  --run_test=/TREC_COVID_RUN/test.run \
  --max_query_length=64\
  --max_seq_length=512 \
  --num_train_docs=10 \
  --num_dev_docs=10 \
  --num_test_docs=1000