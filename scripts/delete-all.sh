#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  _out Deploying ext httpbin
  
  cd ${root_folder}/scripts
  ./delete-istio-ingress.sh
  ./delete-istio-egress.sh
  ./delete-products-nodejs.sh
  ./delete-ext-httpbin.sh
  ./delete-kiali.sh
}

setup

