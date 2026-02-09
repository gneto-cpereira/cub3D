FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    libx11-dev \
    libxext-dev \
    libbsd-dev \
    zlib1g-dev \
    libasound2-dev \
    gcc \
    make \
    x11-apps \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

CMD make re && bash