# bodat
Barely Optimized Deformable Attention vision-Transformers. This repo contains modified DAT code that could run on small sized datasets. The environtment is containerized with Docker to make installation simple. Please run this code on device with CUDA suppoerted GPU (Tested on A100 and RTX 3090). 

## Prequisites

* NVIDIA GPU (CUDA)
* DGX OS (not mandatory)
* [Docker](https://docs.docker.com/)
* [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/)

## How to Use

### Clone the repo:
```
git clone https://github.com/IzzahAlfatih/bodat
```

### Build docker image:
```
docker build -t bodat:<image-tag> .
```
### Run docker container with NVIDIA GPU:
```
sudo ./run.sh <username> <image:image-tag> <gpu memory> <port> --gpus="device=<MIG UUID>" [additional docker parameters]
```
Alternative:
```
sudo docker volume create <volume-name>
```
```
sudo docker run --name <volume-name> -it -p 5020:8888 --gpus '"device=<UUID>"' --mount="type=volume,src=<volume-name>,dst=/workspace" --cpus="4.0" <repository-image:TAG-images>
```
