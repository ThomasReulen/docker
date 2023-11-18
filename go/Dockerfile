FROM --platform=linux/arm64 cdk-go-baseimage

WORKDIR /home/tom/code/dev/app/

ENV GOPROXY=direct

RUN npm install -g aws-cdk aws-cdk-lib && \
    wget "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" && \    
    unzip awscli-exe-linux-aarch64.zip && \
    ./aws/install && \
    rm awscli-exe-linux-aarch64.zip

CMD /bin/sh -c 'while true; do sleep 2; done;'