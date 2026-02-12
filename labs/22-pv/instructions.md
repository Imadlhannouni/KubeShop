# Lab 22: PersistentVolume (Manual)

## Objective
To keep data after a Pod deletion, we need a **PersistentVolume (PV)**.
Assuming we are the "Cluster Admin", let's create a slice of storage.

## The Task
1.  Create `pv.yaml`.
2.  Define a `PersistentVolume` named `task-pv-volume`.
3.  Capacity: `1Gi`.
4.  AccessModes: `ReadWriteOnce`.
5.  HostPath: `/mnt/data` (Simulating a disk on the node).
6.  Apply it.

## Verification
Run `./check.sh`.
