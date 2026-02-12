# Lab 32: Sync Waves

## Objective
Sometimes order matters. You can't start the **API** before the **Database** is ready.
ArgoCD uses **Sync Waves** to order deployments.

## The Task
1.  Verify the concept (Simulation):
    -   ArgoCD applies waves 0, 1, 2...
    -   Add annotation to a mock DB deployment (or your PVC):
        `argocd.argoproj.io/sync-wave: "-1"`
    -   Add annotation to Frontend:
        `argocd.argoproj.io/sync-wave: "1"`
2.  For this lab, just modify your `charts/kubeshop/templates/frontend-deployment.yaml` and add the annotation:
    ```yaml
    metadata:
      annotations:
        argocd.argoproj.io/sync-wave: "5"
    ```
3.  Commit and Push (Simulated by applying locally for check).

## Verification
Run `./check.sh`.
