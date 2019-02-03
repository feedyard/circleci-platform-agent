FROM quay.io/feedyard/circleci-infra-agent:4.3.1

LABEL maintainers = "nic.cheneweth@thoughtworks.com"

RUN apk add --no-cache go && \
    apk add --virtual build-dependencies \
            g++

ENV KOPS_VERSION=1.11.0
ENV KUBECTL_VERSION=v1.13.0

ENV CONSUL_VERSION=1.4.0
ENV CONSUL_SHA256SUM=41f8c3d63a18ef4e51372522c1e052618cdfcffa3d9f02dba0b50820e8279824

RUN curl -LO https://github.com/kubernetes/kops/releases/download/$KOPS_VERSION/kops-linux-amd64 && \
    chmod +x kops-linux-amd64 && \
    mv kops-linux-amd64 /usr/local/bin/kops

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl  && \
    mv ./kubectl /usr/local/bin/kubectl

RUN curl -SLO https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip > consul_${CONSUL_VERSION}_linux_amd64.zip && \
    echo "${CONSUL_SHA256SUM}  consul_${CONSUL_VERSION}_linux_amd64.zip" > consul_${CONSUL_VERSION}_SHA256SUMS && \
    sha256sum -cs consul_${CONSUL_VERSION}_SHA256SUMS && \
    unzip consul_${CONSUL_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    rm -f consul_${CONSUL_VERSION}_linux_amd64.zip

RUN go get -u github.com/cloudflare/cfssl/cmd/cfssl && \
    ln -s ~/go/bin/cfssl /usr/local/bin/cfssl

RUN go get -u github.com/cloudflare/cfssl/cmd/cfssljson && \
    ln -s ~/go/bin/cfssljson /usr/local/bin/cfssljson && \
    apk del build-dependencies

HEALTHCHECK none
