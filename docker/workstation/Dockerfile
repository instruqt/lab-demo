FROM ubuntu:22.04

# Install base utilities and tools
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    gnupg \
    git \
    vim \
    jq \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install instruqt CLI (version 2318-ecada40)
RUN curl -L -o /tmp/instruqt-linux.zip https://github.com/instruqt/cli/releases/download/2318-ecada40/instruqt-linux.zip && \
    unzip /tmp/instruqt-linux.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/instruqt && \
    rm /tmp/instruqt-linux.zip

# Set up working directory
WORKDIR /root
