# Lab 14: Ingress

## Objective
NodePorts are messy (random ports 30000+).
**Ingress** allows you to expose multiple services under a single IP/Domain (e.g., `kubeshop.local`).

## Prerequisites
You need an Ingress Controller.
-   **Minikube**: `minikube addons enable ingress`
-   **Kind**: Requires special config, so for this lab if you are on Kind, you might need to follow [kind docs](https://kind.sigs.k8s.io/docs/user/ingress/).
    -   *If you can't set up Ingress, you can skip this lab and stick to NodePort.*

## The Task
1.  Create `ingress.yaml`.
2.  Define an `Ingress` named `kubeshop-ingress`.
3.  Rules:
    -   Host: `kubeshop.local`
    -   Path: `/` (Prefix) -> Service: `frontend-service` (Port 3000)
    -   Path: `/api` (Prefix) -> Service: `catalog-service` (Port 80)
4.  Apply it.
5.  Get the Ingress IP: `kubectl get ingress`.
6.  Add local DNS mapping: `sudo echo "<INGRESS_IP> kubeshop.local" >> /etc/hosts`
7.  Visit `http://kubeshop.local`.

## Verification
Run `./check.sh`.
