#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {

  _out Deleting products
  
  # kubectl delete serviceentry cloudant --ignore-not-found
  # kubectl delete gateway istio-egressgateway --ignore-not-found
  # kubectl delete destinationrule --ignore-not-found

  cd ${root_folder}/services
  kubectl delete -f services.yaml --ignore-not-found

  cd ${root_folder}/services/api/products/deployment
  kubectl delete -f deployment.yaml --ignore-not-found
  kubectl delete -f istio.yaml --ignore-not-found

  cd ${root_folder}/services/api/products_v2/deployment
  kubectl delete -f deployment.yaml --ignore-not-found
  kubectl delete -f istio.yaml --ignore-not-found

  _out Done deleting products
  }

setup