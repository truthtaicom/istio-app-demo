#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  _out Deleting currency
  cd ${root_folder}/services/api/currency/deployment
  kubectl delete -f deployment.yaml --ignore-not-found
  kubectl delete -f istio.yaml --ignore-not-found

  _out Done deleting products
  }

setup