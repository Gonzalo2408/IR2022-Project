# !/usr/bin/env bash
# SBATCH --partition=csedu
# SBATCH --mem=15G
# SBATCH --cpus-per-task=6
# SBATCH --gres=gpu:1
# SBATCH --time=7:00:00
# SBATCH --output=./logs/experiment3_%J_%a.out
# SBATCH --error=./logs/experiment3_%J_%a.err
# SBATCH --mail-type=BEGIN,END,FAIL

# location of repository and data
project_dir=/ # assume sbatch is called from root project dir

python project_dir/run_treccar.py \
  --data_dir= ${TRECCAR_DIR}/tfrecord \
  --bert_config_file=/bert_config.json \
  --init_checkpoint=${DATA_DIR}/pretrained_models_exp898_model.ckpt-1000000 \
  --output_dir= /Output/ \
  --trec_output=True \
  --do_train=True \
  --do_eval=True \
  --trec_output=True \
  --num_train_steps=400000 \
  --num_warmup_steps=40000 \
  --train_batch_size=32 \
  --eval_batch_size=32 \
  --learning_rate=1e-6 \
  --max_dev_examples=3000 \
  --num_dev_docs=10 \
  --max_test_examples=None \
  --num_test_docs=1000