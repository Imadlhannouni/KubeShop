# Lab 35: Horizontal Pod Autoscaler (HPA)

## Objective
Scale based on traffic, not just because we feel like it.
We need **Metrics Server** (Minikube usually has it as addon, or we install it).

## The Task
1.  Ensure Metrics Server is running:
    `minikube addons enable metrics-server` (or `kubectl top nodes` works).
2.  Create `hpa.yaml`.
3.  Target: `Deployment/frontend`.
4.  MinReplicas: 1, MaxReplicas: 10.
5.  Metric: CPU utilization > 50%.
6.  Apply it: `kubectl apply -f hpa.yaml`.
7.  **Stress Test**:
    `kubectl run -i --tty load-generator --rm --image=busybox --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://frontend; done"`
8.  Watch it scale: `kubectl get hpa -w`.

## Verification
Run `./check.sh`.
