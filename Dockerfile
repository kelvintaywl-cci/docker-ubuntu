FROM ubuntu@sha256:eb1392bbdde63147bc2b4ff1a4053dcfe6d15e4dfd3cce29e9b9f52a4f88bc74

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y --no-install-recommends \
    nginx \
    wget \
    python3.8 \
    python3.8-distutils \
    ca-certificates \
    build-essential \
    libssl-dev \
    python3.8-dev \
    python-numpy \
    libicu-dev \
    git \
    gnupg2 \
    libcap-dev \
    udev \
    && rm -rf /var/lib/apt/lists/*

RUN cat /proc/1/cgroup

RUN . /etc/os-release
RUN echo "deb https://apt.repos.neuron.amazonaws.com bionic main" >> /etc/apt/sources.list
RUN wget -qO - https://apt.repos.neuron.amazonaws.com/GPG-PUB-KEY-AMAZON-AWS-NEURON.PUB | apt-key add -
RUN apt-get update -y
RUN apt-get install aws-neuron-dkms=2.1.5.0 -y
RUN apt-get install aws-neuron-runtime-base -y
RUN apt-get install aws-neuron-runtime -y
RUN apt-get install aws-neuron-tools -y
ENV PATH="/opt/aws/neuron/bin:${PATH}"
