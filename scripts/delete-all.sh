#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  _out ⚡️ Deleting All
  
  cd ${root_folder}/scripts
  ./delete-istio-gateway.sh
  ./delete-istio-tools.sh

  ./delete-ext-fixer.sh
  ./delete-ext-httpbin.sh
  ./delete-ext-mongo.sh

  ./delete-products-mongo.sh
  ./delete-currency.sh

  _out 🚧 Done Deleting All
}

setup

