# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set non-interactive frontend
ENV DEBIAN_FRONTEND=noninteractive 

# Install necessary packages
RUN apt-get update && apt-get install -y \
    software-properties-common \
    apt-transport-https \
    git \
    curl \
    wget \
    ssh \
    # Add deadsnakes PPA for Python 3.12
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y python3.12 \
    # Clean up
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Docker Engine
RUN curl -fsSL "https://get.docker.com" -o get-docker.sh \
    && sh get-docker.sh \
    && rm get-docker.sh

# Add the Microsoft GPG key and Visual Studio Code repository
RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.gpg \
    && echo "deb [arch=amd64] https://packages.microsoft.com/repos/code stable main" | tee /etc/apt/sources.list.d/vscode.list

# Install Visual Studio Code
RUN apt-get update && apt-get install -y code \
    # Clean up
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a new user with specified user ID
RUN useradd -m -d /home/code -u 99 -s /bin/bash code

# Switch to the code user
USER code

# Expose the port for VS Code
EXPOSE 8455

# Start Visual Studio Code on port 8455
CMD ["code", "serve-web", "--host", "0.0.0.0", "--port", "8455", "--user-data-dir", "/home/code", "--without-connection-token"]
