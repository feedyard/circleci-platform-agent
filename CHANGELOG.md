### 09-15-2019 release version 4.9.0  

FROM quay.io/feedyard/circleci-infra-agent:4.10.0   

KOPS_VERSION=1.14.0-beta.2  
KUBECTL_VERSION=v1.15.0  
CONSUL_VERSION=1.6.1  
VAULT_VERSION=1.2.3  

### 06-20-2019 release version 4.7.0

quay.io/feedyard/circleci-base-infra:4.7.0 (tflint)  

### 06-14-2019 release version 4.6.0

quay.io/feedyard/circleci-base-infra:4.6.0  

### 06-14-2019 base image minor change

quay.io/feedyard/circleci-base-infra:4.5.2    

### 06-13-2019 update base image, remove one package

quay.io/feedyard/circleci-base-infra:4.5.1  
remove aws-iam-authenticator (moved to circleci-infra-agent)  

### 06-07-2019 new base image

quay.io/feedyard/circleci-base-infra:4.5.0  

### 01-11-2019 update base image

quay.io/feedyard/circleci-infra-agent:4.2.0  
kops=1.12.0  
kubectl=v1.14.0  
consul=1.5.0  
vault=1.1.2
aws-iam-authenticator=1.12.7

### 01-05-2019 update base image

quay.io/feedyard/circleci-infra-agent:4.1.2  

### 01-02-2019 Patch update and package version changes

kops=1.11.0  
kubectl=v1.13.0  
consul=1.4.0  

### 10-22-2018 Begin changelog

kops=1.10.0  
kubectl=v1.12.0  
consul=1.3.0  
