# cd /path/to/lmms-eval
python3 -m pip install -e .;


MAX_JOBS=64 python3 -m pip install flash-attn --no-build-isolation;
python3 -m pip install torchvision einops timm sentencepiece;


# TASK="chartqa"
# CKPT_PATH="OpenGVLab/InternVL3-2B"
# echo $TASK
# TASK_SUFFIX="${TASK//,/_}"
# echo $TASK_SUFFIX

# accelerate launch --num_processes 8 --main_process_port 12380 -m lmms_eval \
#     --model internvl2 \
#     --model_args pretrained=OpenGVLab/InternVL3-2B \
#     --tasks chartqa \
#     --batch_size 1 \
#     --log_samples \
#     --log_samples_suffix $TASK_SUFFIX \
#     --output_path ./logs/

accelerate launch --num_processes 8 --main_process_port 12380 -m lmms_eval \
    --model internvl2 \
    --model_args pretrained=../LLaMA-Factory/saves/internvl3-8b/chartmimic/projector \
    --tasks chartqa \
    --batch_size 1 \
    --log_samples \
    --verbosity=DEBUG \
    --log_samples_suffix ft-8b-projector \
    --output_path ./logs/