# Lab 04: Sidecars

## Objective
Understand how multiple containers share the same Pod (and network namespace).

## The Task
1.  Edit `pod.yaml`.
2.  Add a second container named `sidecar`.
3.  Use the image `busybox`.
4.  Configure the sidecar to run a loop that queries the main app every 5 seconds:
    -   Command: `sh`, `-c`, `while true; do wget -q -O- localhost:8080/health; sleep 5; done`
5.  Apply the pod.
6.  Check logs of the `sidecar` container to see the output.

## Why this matters?
This implementation (localhost communication) proves that containers in the same Pod share the loopback interface!

## Commands
-   `kubectl logs POD_NAME -c CONTAINER_NAME`
