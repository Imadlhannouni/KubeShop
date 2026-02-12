# Lab 26: Creating a Helm Chart

## Objective
Now let's package **KubeShop**.
Instead of 20 YAML files, we want 1 Chart.

## The Task
1.  Navigate to the `ops-repo` (or just create a folder `charts` in the project root).
    `mkdir -p charts`
2.  Create a skeleton:
    `helm create charts/kubeshop`
3.  **Clean it up**:
    -   Delete everything in `charts/kubeshop/templates/`.
    -   Delete `charts/kubeshop/values.yaml` content (make it empty for now).
4.  **Migrate Manifests**:
    -   Copy non-production YAMLs from previous labs (e.g., `frontend-deployment.yaml`, `catalog-service.yaml`) into `charts/kubeshop/templates/`.
    -   *Tip: You can use the solution files from Lab 18, 19, 11 etc.*
5.  Install your local chart:
    `helm install kubeshop ./charts/kubeshop`

## Verification
Run `./check.sh`.
