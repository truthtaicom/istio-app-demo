#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  _out ⚡️Deleting Istio Tools
  
  cd ${root_folder}/istio/tools
  _out 👉 Deleting Grafana
  kubectl delete -f grafana-gateway.yaml --ignore-not-found
  _out ✅ Done Deleting Grafana

  _out 👉 Deleting Jaeger
  kubectl delete -f jaeger-gateway.yaml --ignore-not-found
  _out ✅ Done Deleting Jaeger

  _out 👉 Deleting Kiali
  kubectl delete -f kiali-gateway.yaml --ignore-not-found
  _out ✅ Done Deleting Kiali

  _out 👉 Deleting Prometheus
  kubectl delete -f prometheus-gateway.yaml --ignore-not-found
  _out ✅ Done Deleting Prometheus
  
  _out 🚧 Deleting Istio Tools
}

setup