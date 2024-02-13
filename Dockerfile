FROM ubuntu:20.04

RUN curl -LJO https://github.com/rockchip-linux/rknn-toolkit2/raw/master/rknn-toolkit2/docker/docker_file/ubuntu_20_04_cp38/sources_bionic.list
COPY sources_bionic.list /etc/apt/sources.list

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
	&& apt-get install -y python3 python3-dev python3-pip gcc vim libprotobuf-dev zlib1g zlib1g-dev libsm6 \
	&& apt-get install -y libgl1 libglib2.0-0 android-tools-adb

RUN cd /usr/bin \
	&& ln -sfn idle3 idle \
	&& ln -sfn pydoc3 pydoc \
	&& ln -sfn python3 python \
	&& ln -sfn python3-config python-config \
	&& ln -sfn pip3 pip \
	&& ls -al

RUN python -m pip install --upgrade pip -i https://mirror.baidu.com/pypi/simple --trusted-host=mirror.baidu.com
RUN pip3 config set global.index-url https://mirror.baidu.com/pypi/simple
RUN pip3 config set install.trusted-host mirror.baidu.com

RUN python3 --version
RUN pip3 --version
RUN curl -LJO https://github.com/rockchip-linux/rknn-toolkit2/raw/master/rknn-toolkit2/docker/docker_file/ubuntu_20_04_cp38/rknn_toolkit2-1.6.0+81f21f4d-cp38-cp38-linux_x86_64.whl
COPY rknn_toolkit2-1.6.0+81f21f4d-cp38-cp38-linux_x86_64.whl rknn_toolkit2-1.6.0+81f21f4d-cp38-cp38-linux_x86_64.whl
RUN pip3 install rknn_toolkit2-1.6.0+81f21f4d-cp38-cp38-linux_x86_64.whl
