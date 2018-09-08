# docker

## Create build

oc login <openshift_url>
oc create -f docker-build.yaml

## Start build
oc start-build <build_name>
