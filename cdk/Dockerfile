FROM --platform=linux/arm64 node:18-bullseye

WORKDIR /home/tom/code

# install cgo-related dependencies
RUN set -eux && \
	apt-get update && \
	apt-get install -y --no-install-recommends \
		iputils-ping openvpn less sudo wget software-properties-common \
        apt-transport-https curl zip git python3 python3-pip jq && \
    curl -sSL https://get.docker.com/ | sudo sh && \
    npm install -g aws-cdk aws-cdk-lib && \
    npm install -g typescript@latest && \
    wget "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" && \
    unzip awscli-exe-linux-aarch64.zip && \
    ./aws/install && \
    rm awscli-exe-linux-aarch64.zip && \
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    kubectl version --client --output=yaml && \
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh && \
    helm repo add crossplane-stable https://charts.crossplane.io/stable && \
    helm repo update && \
    rm -rf /var/lib/apt/lists/*  

CMD /bin/sh -c 'tail -F anything'