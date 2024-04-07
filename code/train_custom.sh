PORT=30001
GPU=$1
CFG=$2
TAG=${3:-'default'}
CKPT=$4

torchrun --nproc_per_node $GPU --master_port $PORT main_custom.py --cfg $CFG --data-path /workspace/cifar --amp --tag $TAG # --resume $CKPT
