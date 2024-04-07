PORT=30001
GPU=$1
CFG=$2
TAG=${3:-'default'}

torchrun --nproc_per_node $GPU --master_port $PORT main.py --cfg $CFG --data-path /workspace/imagenet --amp --tag $TAG
