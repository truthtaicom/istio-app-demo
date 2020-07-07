#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}


function setup() {

  kubectl delete all -l app=curency --ignore-not-found
  
  _out Build Currency Image
  cd ${root_folder}/services/api/currency
  docker build -f Dockerfile -t  currency:1 .

  _out Deploy Currency Image
  cd ${root_folder}/services/api/currency/deployment
  kubectl apply -f deployment.yaml
  kubectl apply -f istio.yaml
}

_out Deploying Currency
setup