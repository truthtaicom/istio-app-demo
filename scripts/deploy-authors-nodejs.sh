#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}


function setup() {

  kubectl delete all -l app=products --ignore-not-found
  
  _out Build Docker Image
  cd ${root_folder}/services/products
  docker build -f Dockerfile -t  products:1 .

  _out Deploy to Docker Desktop
  cd ${root_folder}/services/products/deployment
  kubectl apply -f deployment.yaml
  kubectl apply -f istio.yaml
  
  _out Done deploying products
  _out Wait until the pod has been started: "kubectl get pod --watch | grep products"
  nodeport=$(kubectl get svc products --ignore-not-found --output 'jsonpath={.spec.ports[*].nodePort}')
  _out Sample API call: curl http://127.0.0.1:${nodeport}/api/v1/products
}

_out Deploying products
setup