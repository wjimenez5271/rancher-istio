## Istio on Rancher

This repo is designed to help you quickly "set sail" with [Istio](https://istio.io/) on Rancher's deployment of Kubernetes. This guide will help you stand up the [BookInfo](https://istio.io/docs/samples/bookinfo.html) demo app from Itsio's docs site.

1. [Deploy Rancher](http://docs.rancher.com/rancher/v1.6/en/quick-start-guide/]), create [K8 environment](http://docs.rancher.com/rancher/v1.6/en/kubernetes/). If using with Rancher 1.6, be sure to follow https://github.com/istio/istio/issues/324#issuecomment-304494687 to address issue with `SecurityContextDeny` option for K8.
2. [Install `kubectl`](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
3. Download the `kubectl` config for your new deployment of K8. In Rancher, navigate to Kubernetes > CLI and click "Generate Config". Place the contents contents in `~/.kube/config`
4. Run `deploy-rancher.sh` to apply the K8 services.
5. Run `kubectl get ingress -o wide` to get the IP address of the Istio ingress. You should then be able to view it in your browser at http://$GATEWAYURL/productpage
