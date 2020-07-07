#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}


function setup() {

  kubectl delete all -l app=products-mongo --ignore-not-found

  _out 👉 Deleting products-mongo
  cd ${root_folder}/services/api/products-mongo/deployment
  kubectl delete -f deployment.yaml  --ignore-not-found
  kubectl delete -f istio.yaml --ignore-not-found
  _out ✅ Done Deleting products-mongo
}

setup