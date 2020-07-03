#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}


function setup() {
  
  _out Installing
  istioctl install --set values.global.istioNamespace=istio-system --set values.gateways.istio-ingressgateway.enabled=true --set values.gateways.istio-egressgateway.enabled=true --set values.kiali.enabled=true --set addonComponents.grafana.enabled=true
}

_out Pre-Installing some application
setup