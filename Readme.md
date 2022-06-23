# Ansible K8s The Hard Way

A lab to run [Kelsey Hightower's Kubernetes The Hard Way](https://github.com/kelseyhightower/kubernetes-the-hard-way) on [Hetzner Cloud](https://console.hetzner.cloud/) with a little help from **Ansible** and **Jupyter notebooks**.

**Important**: This project is **for educational purposes only**. The resulting k8s cluster is in no way ment to be production-ready k8s cluster.

## Why

This is just a personal project to help me to better understand the components of a k8s cluster.

By executing (almost) all ansible commands from a Jupyter notebook this lab becomes somewhat reproducible and has a high degree of auto-documentation.

Have a look at the [main notebook](./main.ipynb).

## Differences between this project and Kelsey Hightower's "Kubernetes The Hard Way"

* Instead of using the gcloud this project uses the Hetzner cloud
* All provisioned servers have public IP's and are publicly accessible by default
* Some chapters on gcloud specific networking can be skipped (for example [Provisioning Pod Network Routes](https://github.com/kelseyhightower/kubernetes-the-hard-way/blob/master/docs/11-pod-network-routes.md))

## Known issues

* DNS within the cluster doesn't work yet (see [notebook](./main.ipynb))

## Requirements (if you want to provision the cluster yourself)

* A [Hetzner Cloud](https://console.hetzner.cloud/) account
* A container runtime (docker, containerd,...) to run this lab (ansible + jupyter labs) locally

## Installation

Get a Hetzner Cloud API token from the [Hetzner Cloud](https://console.hetzner.cloud/)

Then run:

```shell
$ bin/build.sh
$ export HCLOUD_TOKEN=<your_hetzner_cloud_token>
$ bin/start.sh
```

## Cleanup

Run:

```shell
$ bin/stop.sh
```

This will first delete all remote server instances and then stop the local container.
