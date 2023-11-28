# Start from Ubuntu 22.04
FROM ubuntu:22.04

# Install basic tooling
RUN apt-get update && \
    apt-get install -y git sudo curl wget build-essential

# Install Haskell pre-conditions
RUN apt-get update && \
    apt-get install -y libffi-dev libffi8ubuntu1 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5

# Create non-root user docker
RUN useradd -ms /bin/bash docker && \
    echo 'docker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Do the rest as non-root user docker
USER docker

# Setup git environment and checker
COPY check-git.sh /home/docker/check-git.sh
RUN echo "$HOME/check-git.sh" >> /home/docker/.bashrc && \
    git config --global core.editor "code --wait" && \
    git config --global --add safe.directory "/workspace"

# Install Haskell
RUN export BOOTSTRAP_HASKELL_NONINTERACTIVE=1 && \
    export BOOTSTRAP_HASKELL_INSTALL_HLS=1 && \
    export BOOTSTRAP_HASKELL_ADJUST_BASHRC=1 && \
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | bash
