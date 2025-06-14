ARG PLATFORM
FROM --platform=$PLATFORM ubuntu

ARG PLATFORM

WORKDIR /home/tom/code

COPY startvpn.sh /root/startvpn.sh

RUN apt-get update && \
    apt-get install -y gnupg software-properties-common curl wget iputils-ping zip git jq openvpn net-tools dnsutils nodejs npm tar && \
    if [ "$PLATFORM" = "linux/arm64" ]; then \
       ARCH=arm64 && \
       curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"; \
       curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"; \
       curl "https://get.helm.sh/helm-v3.13.2-linux-arm64.tar.gz" -o "helm.tar.gz"; \
       HELM_PATH="linux-arm64/helm"; \
    else \
       ARCH=amd64 && \
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
    # eksctl    
    PLATFORM=$(uname -s)_$ARCH && \
    curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz" && \
    curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check && \
    tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz && \
    mv /tmp/eksctl /usr/local/bin && \
    # helm 
    tar -zxvf helm.tar.gz && \
    chmod +x $HELM_PATH && \
    mv $HELM_PATH /usr/local/bin/helm && \
    # terraform
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list && \
    apt update && apt install terraform && \
    # vpn script
    chmod +x /root/startvpn.sh


CMD /bin/sh -c 'tail -F anything'


