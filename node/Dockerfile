ARG PLATFORM
FROM --platform=$PLATFORM node:20

ARG PLATFORM

EXPOSE 3000 

ENV NODE_ENV=development

WORKDIR /home/node/app

RUN cd / && \
    apt-get update && \
    apt-get install -y curl nano iputils-ping zip git software-properties-common java-common && \
    if [ "$PLATFORM" = "linux/arm64" ]; then \
       curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -L -o "awscliv2.zip"; \              
       curl "https://corretto.aws/downloads/latest/amazon-corretto-11-aarch64-linux-jdk.deb" -L -o "java.deb"; \
    else \
       curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -L -o "awscliv2.zip"; \
       curl "https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.deb" -L -o "java.deb"; \       
    fi && \
    # java coretto 
    dpkg --install java.deb && \    
    # aws cli 
    unzip awscliv2.zip && \
    ./aws/install && \
    rm awscliv2.zip && \
    # aws amplify
    npm install -g @aws-amplify/cli && \
    npm install react react-dom 
