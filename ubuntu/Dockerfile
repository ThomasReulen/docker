ARG PLATFORM
FROM --platform=$PLATFORM ubuntu

ARG PLATFORM

WORKDIR /home/tom/code

RUN apt-get update && \
    apt-get install -y curl wget iputils-ping zip git python3 python3-pip jq && \
    if [ "$PLATFORM" = "linux/arm64" ]; then \
       curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"; \
       curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"; \
       curl "https://get.helm.sh/helm-v3.13.2-linux-arm64.tar.gz" -o "helm.tar.gz"; \
       HELM_PATH="linux-arm64/helm"; \
    else \
       curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"; \
       curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"; \
       curl "https://get.helm.sh/helm-v3.13.2-linux-amd64.tar.gz" "helm.tar.gz"; \
    fi && \
    # aws cli 
    unzip awscliv2.zip && \
    ./aws/install && \
    rm awscliv2.zip && \
    # kubectl 
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    kubectl version --client --output=yaml && \
    # helm 
    tar -zxvf helm.tar.gz && \
    chmod +x $HELM_PATH && \
    mv $HELM_PATH /usr/local/bin/helm && \
    pip install boto3 

CMD /bin/sh -c 'tail -F anything'




