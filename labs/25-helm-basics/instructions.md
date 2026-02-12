# Lab 25: Helm Basics

## Objective
**Helm** is the "Package Manager" for Kubernetes (like `apt` or `npm`).
Before we build our own package, let's use an existing one to understand the workflow.

## Prerequisites
You need `helm` installed.
-   Linux/Mac: `curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash`
-   Or check `bin/` if we bundled it (we didn't, so install it!).

## The Task
1.  Add the Bitnami repo:
    `helm repo add bitnami https://charts.bitnami.com/bitnami`
2.  Search for redis:
    `helm search repo redis`
3.  Install Redis:
    `helm install my-redis bitnami/redis`
4.  Check status:
    `helm list`
    `kubectl get pods` (You will see redis master and replicas).
5.  Uninstall it:
    `helm uninstall my-redis`

## Verification
Run `./check.sh`.
(The check will verify that you have `helm` installed and can run `helm list`).
