# Lab 09: Liveness & Readiness Probes

## Objective
Kubernetes needs to know:
1.  **Liveness**: Is the app alive? (If not, restart it).
2.  **Readiness**: Is the app ready to take traffic? (If not, don't send traffic).

## The Task
1.  Edit `deployment.yaml` (from Lab 06/07).
2.  Add `livenessProbe` to the container spec:
    -   `httpGet`: path `/health`, port `8080`.
    -   `initialDelaySeconds`: 5.
3.  Add `readinessProbe` to the container spec:
    -   `httpGet`: path `/health`, port `8080`.
    -   `initialDelaySeconds`: 5.
4.  Apply the changes.
5.  Describe a pod (`kubectl describe pod ...`) to see the "Liveness: ... Readiness: ..." fields.

## Verification
Run `./check.sh` to verify probes are configured correctly.
