#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}


function setup() {

  kubectl delete all -l app=products-mongo --ignore-not-found

  _out 👉 Build products-mongo
  cd ${root_folder}/services/api/products-mongo
  docker build -f Dockerfile -t products-mongo:1 .
  _out ✅ Done Build products-mongo

  _out 👉 Deploy products-mongo
  cd ${root_folder}/services/api/products-mongo/deployment
  kubectl apply -f deployment.yaml
  kubectl apply -f istio.yaml
  _out ✅ Done Deploy products-mongo
}

setup