ARG PLATFORM
FROM --platform=$PLATFORM cdk-go-baseimage

ARG PLATFORM

WORKDIR /home/tom/code/app/

ENV GOPROXY=direct

RUN npm install -g aws-cdk aws-cdk-lib && \
    if [ "$PLATFORM" = "linux/arm64" ]; then \
       curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"; \
    else \
       curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"; \
    fi && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm awscliv2.zip

CMD tail -F anything

    