FROM quay.io/feedyard/circleci-base-agent:3.8.7

LABEL maintainers = "nic.cheneweth@thoughtworks.com"

RUN apk add --no-cache go

ENV KOPS_VERSION=1.10.0
ENV KUBECTL_VERSION=v1.11.3

ENV CONSUL_VERSION=1.2.3
ENV CONSUL_SHA256SUM=f97996296ef3905c38c504b35035fb731d3cfd9cad129c9523402a4229c709c5

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
    ln -s ~/go/bin/cfssljson /usr/local/bin/cfssljson

HEALTHCHECK none