# Lab 06: Deployments

## Objective
ReplicaSets are great, but they don't handle updates (rolling out v2) very well.
**Deployments** wrap ReplicaSets and manage the lifecycle of updates. This is the standard way to run stateless apps.

## The Task
1.  **Cleanup**: Delete your ReplicaSet from Lab 05 first: `kubectl delete rs catalog-rs`.
2.  Create `deployment.yaml`.
3.  Define a `Deployment` named `catalog-deploy`.
4.  Replicas: `3`.
5.  Selector & Template: Same as before (`app: catalog`, image `kubeshop/catalog:v1`).
6.  Apply it.

## Verification
Run `./check.sh` to confirm the Deployment created the ReplicaSet, which created the Pods.
