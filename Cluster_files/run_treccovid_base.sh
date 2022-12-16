#!/usr/bin/env bash
#SBATCH --partition=csedu
#SBATCH --mem=16G
#SBATCH --cpus-per-task=2
#SBATCH --gres=gpu:2
#SBATCH --time=1:00:00
#SBATCH --output=./Output/treccovid_train_base.out
#SBATCH --error=./Output/treccovid_train_base.err
#SBATCH --account=cjordaan


# location of repository and data
project_dir=.. # assume sbatch is called from root project dir

python run_treccar.py \
  --data_dir=./Output/CDS_final \
  --bert_config_file=/ceph/csedu-scratch/course/I00041_informationretrieval/group20/Json_files/bert_config.json \
  --init_checkpoint=/ceph/csedu-scratch/course/I00041_informationretrieval/group20/Transformer_ranking/model.ckpt-150000\
  --output_dir=./Output/output_trec_cord_base/ \
  --trec_output=True \
  --do_train=True \
  --do_eval=True \
  --trec_output=True \
  --num_train_steps=1 \
  --num_warmup_steps=1 \
  --train_batch_size=4 \
  --eval_batch_size=4 \
  --learning_rate=1e-6 \
  --max_dev_examples=3000 \
  --num_dev_docs=10 \
  --max_test_examples=10 \
  --num_test_docs=1000 \
  --use_tpu=False 
