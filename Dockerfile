FROM quay.io/feedyard/circleci-infra-agent:4.10.0

LABEL maintainers = "nic.cheneweth@thoughtworks.com"

RUN apk add --no-cache go=1.12.8-r0 && \
    apk add --no-cache --virtual build-dependencies g++=8.3.0-r0

ENV KOPS_VERSION=1.14.0-beta.2
ENV KUBECTL_VERSION=v1.15.0

ENV CONSUL_VERSION=1.6.1
ENV CONSUL_SHA256SUM=a8568ca7b6797030b2c32615b4786d4cc75ce7aee2ed9025996fe92b07b31f7e
ENV VAULT_VERSION=1.2.3
ENV VAULT_SHA256SUM=fe15676404aff35cb45f7c957f90491921b9269d79a8f933c5a36e26a431bfc4

RUN curl -SLO https://github.com/kubernetes/kops/releases/download/$KOPS_VERSION/kops-linux-amd64 && \
    chmod +x kops-linux-amd64 && \
    mv kops-linux-amd64 /usr/local/bin/kops && \
    curl -SLO https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl  && \
    mv ./kubectl /usr/local/bin/kubectl && \
    curl -SLO https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip > consul_${CONSUL_VERSION}_linux_amd64.zip && \
    echo "${CONSUL_SHA256SUM}  consul_${CONSUL_VERSION}_linux_amd64.zip" > consul_${CONSUL_VERSION}_SHA256SUMS && \
    sha256sum -cs consul_${CONSUL_VERSION}_SHA256SUMS && \
    unzip consul_${CONSUL_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    rm -f consul_${CONSUL_VERSION}_linux_amd64.zip && \
    curl -SLO https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip > vault_${VAULT_VERSION}_linux_amd64.zip && \
    echo "${VAULT_SHA256SUM}  vault_${VAULT_VERSION}_linux_amd64.zip" > vault_${VAULT_VERSION}_SHA256SUMS && \
    sha256sum -cs vault_${VAULT_VERSION}_SHA256SUMS && \
    unzip vault_${VAULT_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    rm -f vault_${VAULT_VERSION}_linux_amd64.zip

RUN go get -u github.com/cloudflare/cfssl/cmd/cfssl && \
    ln -s ~/go/bin/cfssl /usr/local/bin/cfssl && \
    go get -u github.com/cloudflare/cfssl/cmd/cfssljson && \
    ln -s ~/go/bin/cfssljson /usr/local/bin/cfssljson && \
    apk del build-dependencies

HEALTHCHECK NONE
