# Lab 24: Using the PVC

## Objective
We have a Bound PVC. Now let's use it in a Pod.
Ideally we would use a **StorageClass** for dynamic provisioning, but for now let's just mount our manual claim.

## The Task
1.  Update `deployment.yaml` for `order`.
2.  Change the volume section.
3.  Instead of `emptyDir`, use `persistentVolumeClaim`.
4.  ClaimName: `task-pv-claim`.
5.  Apply it.
6.  Delete the pod. When it comes back, the data in `/var/log` (or whereever you mounted it) should still be there (persisted on HostPath).

## Verification
Run `./check.sh`.
