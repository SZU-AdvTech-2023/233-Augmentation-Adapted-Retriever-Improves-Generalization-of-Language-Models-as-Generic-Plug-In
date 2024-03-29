export PYTHONPATH=/home/txh/code/Augmentation-Adapted-Retriever-main:$PYTHONPATH
export CUDA_VISIBLE_DEVICES=0,1,2,4,5
python  src/Retriever/driver/train_dr.py  \
    --output_dir data/msmarco/t5-ance_aar/output  \
    --model_name_or_path checkpoints/t5-ance  \
    --do_train  \
    --save_steps 10000  \
    --eval_steps 4000  \
    --train_path data/msmarco/t5-ance/marco_qa/train.new.hn.jsonl  \
    --eval_path data/msmarco/t5-ance/marco_qa/val.hn.jsonl  \
    --fp16  \
    --per_device_train_batch_size 8  \
    --train_n_passages 8  \
    --use_all_positive_passages  \
    --learning_rate 5e-6  \
    --q_max_len 32  \
    --p_max_len 128  \
    --num_train_epochs 6  \
    --logging_dir data/msmarco/t5-ance_aar/log  \
    --evaluation_strategy steps