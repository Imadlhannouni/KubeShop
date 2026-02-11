# Lab 05: ReplicaSets

## Objective
Pods are ephemeral. If they get deleted, they are gone.
**ReplicaSets** ensure a specified number of Pod replicas are running at any given time.

## The Task
1.  Create a file named `replicaset.yaml`.
2.  Define a `ReplicaSet` named `catalog-rs`.
3.  Set `replicas: 3`.
4.  Use the selector `matchLabels: app: catalog`.
5.  Use the same Pod template as Lab 03 (image: `kubeshop/catalog:v1`).
6.  Apply it.
7.  Delete one of the pods manually (`kubectl delete pod ...`) and watch it get recreated instantly!

## Commands
-   `kubectl get rs`
-   `kubectl delete pod <pod-name>`

## Verification
Run `./check.sh` to see if you have 3 running pods managed by the ReplicaSet.
