#!/usr/bin/env bash
set -x

istioctl_bin=$PWD/bin/istioctl

kubectl apply -f install/kubernetes/istio-rbac-alpha.yaml
kubectl apply -f install/kubernetes/istio.yaml
kubectl apply -f install/kubernetes/addons/prometheus.yaml
kubectl apply -f install/kubernetes/addons/grafana.yaml
kubectl apply -f install/kubernetes/addons/servicegraph.yaml
kubectl apply -f <($istioctl_bin kube-inject -f samples/apps/bookinfo/bookinfo.yaml)
