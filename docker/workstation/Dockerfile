FROM ghcr.io/jumppad-labs/dind:v1.1.0

# Base image already includes: curl, ca-certificates, gnupg, docker-ce, docker-ce-cli, containerd.io
# Install additional packages needed for demo
RUN apt-get update && apt-get install -y \
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

CMD ["/bin/bash"]
