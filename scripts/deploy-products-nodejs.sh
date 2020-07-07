#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}


function setup() {

  kubectl delete all -l app=products --ignore-not-found

  cd ${root_folder}/services
  kubectl apply -f services.yaml
  
  _out Build v1 Docker Image
  cd ${root_folder}/services/api/products
  docker build -f Dockerfile -t  products:1 .

  _out Deploy v1 to Docker Desktop
  cd ${root_folder}/services/api/products/deployment
  kubectl apply -f deployment.yaml
  kubectl apply -f istio.yaml

  _out Build products_v2
  cd ${root_folder}/services/api/products_v2
  docker build -f Dockerfile -t  products:2 .

  _out Deploy products_v2
  cd ${root_folder}/services/api/products_v2/deployment
  kubectl apply -f deployment.yaml
  kubectl apply -f istio.yaml

  _out Build products-mongo
  cd ${root_folder}/services/api/products-mongo
  docker build -f Dockerfile -t products-mongo:1 .

  _out Deploy products-mongo
  cd ${root_folder}/services/api/products-mongo/deployment
  kubectl apply -f deployment.yaml
  kubectl apply -f istio.yaml
  
  _out Done deploying products
  _out Wait until the pod has been started: "kubectl get pod --watch | grep products"
  nodeport=$(kubectl get svc products --ignore-not-found --output 'jsonpath={.spec.ports[*].nodePort}')
  _out Sample API call: curl http://127.0.0.1:${nodeport}/api/products
}

_out Deploying products
setup