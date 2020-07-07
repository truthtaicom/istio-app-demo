#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  _out Deploying ext httpbin
  
  cd ${root_folder}/scripts
  # ./deploy-istio-ingress-v1.sh
  # ./deploy-istio-egress.sh
  # ./deploy-products-nodejs.sh

  ./deploy-istio-gateway.sh
  ./deploy-istio-tools.sh

  ./deploy-ext-fixer.sh
  ./deploy-ext-httpbin.sh
  ./deploy-ext-mongo.sh

  ./deploy-products-mongo.sh
  ./deploy-currency.sh
  
  ./show-address-all.sh
}

setup

