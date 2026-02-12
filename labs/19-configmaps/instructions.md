# Lab 19: ConfigMaps

## Objective
hardcoding `value: "http://catalog-service"` in the Deployment is still not ideal. What if we have 50 deployments using the same URL?
We use a **ConfigMap** to centralize configuration.

## The Task
1.  Create `configmap.yaml`.
2.  Define a `ConfigMap` named `app-config`.
3.  Data:
    -   `catalog.url`: `http://catalog-service`
4.  Update your `frontend-env.yaml` (or create `frontend-cm.yaml`).
5.  Instead of `value: ...`, use:
    ```yaml
    valueFrom:
      configMapKeyRef:
        name: app-config
        key: catalog.url
    ```
6.  Apply both.

## Verification
Run `./check.sh`.
