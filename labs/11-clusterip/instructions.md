# Lab 11: Services (ClusterIP)

## Objective
Pods change IPs when they restart. **Services** provide a stable IP and DNS name.
We need to expose the **Catalog** pods so the **Frontend** can talk to them reliably.

## The Task
1.  Create `service.yaml`.
2.  Define a `Service` named `catalog-service`.
3.  Selector: `app: catalog`.
4.  Ports:
    -   Protocol: `TCP`
    -   Port: `80` (The service port)
    -   TargetPort: `8080` (The container port)
5.  Type: `ClusterIP` (Default).
6.  Apply it.

## Verification
Run `./check.sh`.
It will check if the service exists and if it has endpoints (meaning it found the pods).
