# Lab 07: Rolling Updates

## Objective
Update the application from `v1` to `v2` without downtime.

## Prerequisite
Ensure Lab 06 is running (`kubectl get deploy catalog-deploy`).

## The Task
1.  **Build v2**:
    -   Go to `src/catalog`.
    -   Open `main.go` and change "Kubernetes T-Shirt" price to `20.00`.
    -   Build the image: `docker build -t kubeshop/catalog:v2 .`
2.  **Update Deployment**:
    -   Edit `deployment.yaml` (or use `kubectl set image`).
    -   Change image to `kubeshop/catalog:v2`.
    -   Apply it.
3.  **Watch**:
    -   Run `kubectl rollout status deploy/catalog-deploy`.
    -   Run `kubectl get pods -w` to see pods terminating and creating.

## Verification
Run `./check.sh` to confirm all pods are running `v2`.
