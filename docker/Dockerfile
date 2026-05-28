FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        clang \
        cmake \
        curl \
        git \
        libaio-dev \
        meson \
        ninja-build \
        pkg-config \
        python3 \
        python3-docutils \
        python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --break-system-packages --no-cache-dir \
        flake8 \
        mypy \
        pytest

RUN curl --proto '=https' --tlsv1.2 -fsSL https://sh.rustup.rs \
        | sh -s -- -y --default-toolchain 1.89.0 \
    && /root/.cargo/bin/rustup component add clippy

ENV PATH="/root/.cargo/bin:${PATH}"

WORKDIR /workspace/libvhost

CMD ["/bin/bash"]

RUN <<EOF
    set -eux
    echo 'PS1="\[\033[0;31m\]\u@agents:\[\033[0m\]\w$ "' > ~/.bashrc
EOF
