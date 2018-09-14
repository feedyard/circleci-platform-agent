
# feedyard/circleci-platform-agent

circleci primary container, based on feedyard/circleci-base-agent. includes common tools for building or managing     
kubernetes and platform resources as code in circleci pipelines.  

platform functionality;
kops  
kubectl  


tools or frameworks:
go  
consul  
cfssl  
cfssljson  

See CHANGELOG for list of installed packages/versions  

## requirements for ci and local development

Environment variable FEEDYARD_PIPELINE_KEY used as encrypt/decrypt key for required secrets. Set matching var in  
circleci repository and include local file `local.env` with the following access information.  

```$xslt
FEEDYARD_CIRCLECI_QUAYIO_DEPLOY_USER=
FEEDYARD_CIRCLECI_QUAYIO_DEPLOY_USER_TOKEN=
```

run (or review) `prereqs.sh` to install requirements for local development.  
