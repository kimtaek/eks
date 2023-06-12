#!/bin/bash

if [ ! -z ${PLUGIN_DEBUG} ]; then
  env
  kubectl version
fi

if [[ "x$PLUGIN_ACCOUNT" == "x" ]]; then
  PLUGIN_ACCOUNT="deployer"
fi

IMAGE=${PLUGIN_REGISTRY}/${PLUGIN_REPOSITORY}:${PLUGIN_TAG}

if [[ "x$PLUGIN_REGISTRY" == "x" ]]; then
  IMAGE=${PLUGIN_REPOSITORY}:${PLUGIN_TAG}
fi

echo ${PLUGIN_TOKEN} | base64 -d > token
echo ${PLUGIN_CERT} | base64 -d > ca

kubectl config set-cluster default --server=${PLUGIN_SERVER} --certificate-authority=ca
kubectl config set-credentials ${PLUGIN_ACCOUNT} --token="$(cat token)"
kubectl config set-context default --cluster=default --user=${PLUGIN_ACCOUNT}
kubectl config use-context default

kubectl -n ${PLUGIN_NAMESPACE} set image deployment/${PLUGIN_DEPLOYMENT} ${PLUGIN_CONTAINER}=${IMAGE} --record
echo "kubectl -n ${PLUGIN_NAMESPACE} set image deployment/${PLUGIN_DEPLOYMENT} ${PLUGIN_CONTAINER}=${IMAGE} --record"

if [ ! -z ${PLUGIN_WATCH} ]; then
  kubectl -n ${PLUGIN_NAMESPACE} rollout status deployment/${PLUGIN_DEPLOYMENT} --watch --timeout 3m
fi
