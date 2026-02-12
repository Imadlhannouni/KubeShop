# Lab 21: Ephemeral Storage (EmptyDir)

## Objective
Containers are ephemeral. If they crash, their files die with them.
**EmptyDir** is a volume that lives as long as the **Pod** (not the container). It's great for caches or temporary logs.

## The Task
1.  Create `order-emptydir.yaml`.
2.  Define a `Deployment` for `order`.
3.  Add a volume of type `emptyDir` named `logs-vol`.
4.  Mount it to `/var/log` in the container.
5.  Apply it.
6.  Exec into the pod and write a file: `kubectl exec <pod> -- touch /var/log/test.txt`.
7.  Kill the container (not the pod) or delete the pod and see what happens. (Hint: If pod dies, data dies).

## Verification
Run `./check.sh`.
