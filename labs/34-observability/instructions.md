# Lab 34: Observability (Prometheus & Grafana)

## Objective
You can't fix what you can't see.
We need metrics (CPU, Memory, Request Rates).
We will use the **Kube-Prometheus-Stack**.

## The Task
1.  Add the Helm Repo:
    `helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`
2.  Install the stack (It's big!):
    `kubectl create ns monitoring`
    `helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack -n monitoring`
3.  Access Grafana:
    -   `kubectl port-forward svc/kube-prometheus-stack-grafana 3000:80 -n monitoring`
    -   User: `admin`
    -   Password: `prom-operator` (usually, checking secret if not).
4.  Explore the "Kubernetes / Compute Resources / Pods" dashboard.

## Verification
Run `./check.sh`.
