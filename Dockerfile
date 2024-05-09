FROM nvidia/cuda:11.3.1-base-ubuntu20.04

RUN apt-get update -y

RUN apt-get install -y libsm6 libxext6 libxrender-dev git nvidia-modprobe

RUN apt-get install python3 python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools -y

RUN apt-get install python3-venv -y

RUN pip3 install torch==1.11.0+cu113 torchvision==0.12.0+cu113 torchaudio==0.11.0 --extra-index-url https://download.pytorch.org/whl/cu113

RUN pip3 install numpy==1.20.3 timm==0.5.4 einops==0.6.1 PyYAML yacs termcolor thop

RUN pip3 install natten==0.14.6+torch1110cu113 -f https://shi-labs.com/natten/wheels

RUN apt-get install nano

RUN pip3 install jupyter

RUN jupyter notebook --generate-config

ENV JUPYTER_PORT=8888

ENV JUPYTER_PASSWORD=""

COPY code/ /workspace/

CMD ["/bin/bash", "-c", "HASHED_PASSWORD=$(python3 -c \"from jupyter_server.auth import passwd; print(passwd('$JUPYTER_PASSWORD'))\"); echo \"c.NotebookApp.password = u'$HASHED_PASSWORD'\" >> ~/.jupyter/jupyter_notebook_config.py && SHELL=/bin/bash jupyter lab --no-browser --ip=0.0.0.0 --allow-root --notebook-dir=/workspace/"]
