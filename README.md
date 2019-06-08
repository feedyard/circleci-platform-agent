# feedyard/circleci-platform-agent [![CircleCI](https://circleci.com/gh/feedyard/circleci-platform-agent.svg?style=svg)](https://circleci.com/gh/feedyard/circleci-platform-agent) [![Docker Repository on Quay](https://quay.io/repository/feedyard/circleci-platform-agent/status "Docker Repository on Quay")](https://quay.io/repository/feedyard/circleci-platform-agent) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/feedyard/circleci-platform-agent/master/LICENSE) [![Base Image](https://img.shields.io/badge/FROM-alpine-blue.svg)](https://alpinelinux.org)

Based on [feedyard/circleci-infra-agent](https://github.com/feedyard/circleci-infra-agent). includes common tools for building or managing     
kubernetes and platform resources as code in circleci pipelines.  


packages/bin          |
----------------------|
kops                  |
kubectl               | 
aws-iam-authenticator | 
go                    |
consul                |
cfssl                 |
cfssljson             |

See CHANGELOG for list of installed packages/versions  


curl -SLO https://releases.hashicorp.com/vault/1.1.3/vault_1.1.3_linux_amd64.zip
echo "c243dce14b2e48e3667c2aa5b7fb37009dd7043b56032d6ebe50dd456715fd3f vault_1.1.3_linux_amd64.zip" > vault_1.1.3_SHA256SUMS