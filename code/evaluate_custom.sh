PORT=30001
GPU=$1
CFG=$2
CKPT=$3

torchrun --nproc_per_node $GPU --master_port $PORT main_custom.py --cfg $CFG --data-path /workspace/cifar --eval --resume $CKPT
