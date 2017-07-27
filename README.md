## Istio on Rancher

This repo is designed to help you quickly "set sail" with [Istio](https://istio.io/) on Rancher's deployment of Kubernetes. This guide will help you stand up the [BookInfo](https://istio.io/docs/samples/bookinfo.html) demo app from Itsio's docs site.


### Deploy Rancher/Kubernetes 
1. [Deploy Rancher 1.6 or higher](http://docs.rancher.com/rancher/v1.6/en/quick-start-guide/]), create [K8 environment](http://docs.rancher.com/rancher/v1.6/en/kubernetes/). 
2. [Install `kubectl` locally](https://kubernetes.io/docs/tasks/tools/install-kubectl/). This is the CLI tool for K8 and will allow us to make API calls to the cluster.
3. Download the `kubectl` config for your new deployment of K8. In Rancher, navigate to Kubernetes > CLI and click "Generate Config". Place the contents contents in `~/.kube/config`


### Option A - Deploy Istio using Helm (*recommended*)
1. [Install Helm locally](https://github.com/kubernetes/helm/blob/master/docs/install.md). At the time of this writing, Rancher 1.6 supports helm/tiller 2.3, so you want to have a 2.3.x helm client. This is the helm client which will use the information we previously setup in `~/.kube/config` to talk to our K8 cluster. We don't need to setup tiller because it is already inclueded in the Rancher distribution.
2. Add my custom helm chart repository: `helm repo add wjimenez5271 https://wjimenez5271.github.io/istio-helm/`
3. Deploy the chart `helm install -n istio wjimenez5271/istio-helm`


### Option B - Deploy Istio using kubectl
1. Run `deploy-rancher.sh` to apply the K8 services.


### Deploy Istio Sample Application (BookInfo)
1. From the root of this repo directory, Run `istioctl_bin=$PWD/bin/istioctl`
2. While in the same directory, run `kubectl apply -f <(istioctl kube-inject -f samples/apps/bookinfo/bookinfo.yaml)`


### Viewing the Sample Applicatiomn

1. Run `kubectl get ingress -o wide` to get the IP address of the Istio ingress. 
2. You should then be able to view `BookInfo` in your browser at http://$GATEWAYURL/productpage
3. See https://istio.io/docs/samples/bookinfo.html for more information on this app
