FROM quay.io/feedyard/circleci-infra-agent:4.8.0

LABEL maintainers = "nic.cheneweth@thoughtworks.com"

RUN apk add --no-cache go=1.12.6-r0 && \
    apk add --no-cache --virtual build-dependencies g++=8.3.0-r0

ENV KOPS_VERSION=1.14.0-alpha.3
ENV KUBECTL_VERSION=v1.15.0

ENV CONSUL_VERSION=1.5.2
ENV CONSUL_SHA256SUM=d4aaf1956c39ed778d10642e301d382ce37fcddf268366700f2a45e737157ef3
ENV VAULT_VERSION=1.1.3
ENV VAULT_SHA256SUM=293b88f4d31f6bcdcc8b508eccb7b856a0423270adebfa0f52f04144c5a22ae0

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
