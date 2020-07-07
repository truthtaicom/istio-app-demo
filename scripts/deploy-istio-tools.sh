#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  # export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
  # echo $INGRESS_HOST
  export INGRESS_DOMAIN=127.0.0.1.nip.io

  _out ⚡️ Deploying Istio Tools
  
  cd ${root_folder}/istio/tools
  _out 👉 Deploying Grafana
  cat grafana-gateway.yaml | \
  sed 's/\${INGRESS_DOMAIN}'"/$INGRESS_DOMAIN/g" | \
  kubectl apply -f -
  _out ✅ Done deploying Grafana

  _out 👉 Deploying Jaeger
  cat jaeger-gateway.yaml | \
  sed 's/\${INGRESS_DOMAIN}'"/$INGRESS_DOMAIN/g" | \
  kubectl apply -f -
  _out ✅ Done deploying Jaeger

  _out 👉 Deploying Kiali
  cat kiali-gateway.yaml | \
  sed 's/\${INGRESS_DOMAIN}'"/$INGRESS_DOMAIN/g" | \
  kubectl apply -f -
  _out ✅ Done deploying Kiali

  _out 👉 Deploying Prometheus
  cat prometheus-gateway.yaml | \
  sed 's/\${INGRESS_DOMAIN}'"/$INGRESS_DOMAIN/g" | \
  kubectl apply -f -
  _out ✅ Done deploying Prometheus
  
  _out 🚧 Done Istio Tools
}

setup