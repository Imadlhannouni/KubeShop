# Lab 12: Services (NodePort)

## Objective
ClusterIP is only internal. To access the app from your laptop, we need a **NodePort**.
Let's expose the **Frontend** service.

## The Task
1.  Deploy the Frontend Pod (if not running): `kubectl run frontend --image=kubeshop/frontend:v1 --port=3000 --env="CATALOG_URL=http://catalog-service"`
    *(Or better, create a Deployment for it, but for this lab a simple runner is fine)*.
2.  Create `frontend-svc.yaml`.
3.  Define a `Service` named `frontend-service`.
4.  Selector: `run: frontend` (if you used kubectl run) or `app: frontend`.
5.  Type: `NodePort`.
6.  Ports:
    -   Port: `3000`
    -   TargetPort: `3000`
    -   NodePort: `30080` (Optional, but let's try to fix it so we know where to go).
7.  Apply it.
8.  Access the app at `http://localhost:30080` (or `minikube ip:30080`).

## Verification
Run `./check.sh`.
