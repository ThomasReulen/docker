ARG PLATFORM
FROM --platform=$PLATFORM node:18-bullseye
ARG PLATFORM

WORKDIR /home/node/app/

RUN set -eux && \
	apt-get update && \
	apt-get install -y --no-install-recommends \
		iputils-ping openvpn less sudo wget software-properties-common \
        apt-transport-https curl zip git python3 python3-pip jq && \
    curl -sSL https://get.docker.com/ | sudo sh && \
    npm install -g typescript@latest && \
    npm install -g aws-cdk aws-cdk-lib && \
    if [ "$PLATFORM" = "linux/arm64" ]; then \
       curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -L -o "awscliv2.zip"; \
       #curl "https://corretto.aws/downloads/latest/amazon-corretto-11-aarch64-linux-jdk.deb" -L -o "java.deb"; \
    else \
       curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -L -o "awscliv2.zip"; \
       #curl "https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.deb" -L -o "java.deb"; \
    fi && \    
    unzip awscliv2.zip && \
    ./aws/install && \
    rm awscliv2.zip && \
    rm -rf /var/lib/apt/lists/*  

CMD /bin/sh -c 'tail -F anything'