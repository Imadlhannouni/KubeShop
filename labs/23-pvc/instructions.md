# Lab 23: PersistentVolumeClaim (PVC)

## Objective
Developers don't manage PVs. They request storage via a **PersistentVolumeClaim (PVC)**.
The cluster then binds the PVC to an available PV.

## The Task
1.  Create `pvc.yaml`.
2.  Define a `PersistentVolumeClaim` named `task-pv-claim`.
3.  Request `1Gi` storage.
4.  AccessMode: `ReadWriteOnce`.
5.  StorageClassName: `manual` (Matches the PV we created).
6.  Apply it and check status: `kubectl get pvc`. It should say `Bound`.

## Verification
Run `./check.sh`.
