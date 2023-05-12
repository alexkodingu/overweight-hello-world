# overweight-hello-world

Hello world from an app with bdd on GKE

Deploy an node.js in K8S (GKE auto), If you don't use your [GCP free tier](https://cloud.google.com/free/docs/free-cloud-features), it should fit in.


## Requirement

### GCP account

## RUN

### Run with GitHub


### Run locally

Mostly the following command will make you do the same command of the GitHub CI


1 is mandatory, if you already made one

## 1 set required env variable

## manage terraform

docker run --rm -it --name terraform --env-file ./test.env -v $(pwd)/terraform:/workspace -w /workspace hashicorp/terraform:latest apply


``` terraform apply xx ```

## deploy application

### build app into K8S

### deploy with helm

## Disclaimer

It's given as an example and testing, none of the elements are production ready