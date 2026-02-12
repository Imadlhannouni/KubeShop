# Lab 27: Helm Values (Templating)

## Objective
Hardcoded YAML is bad. We want to change the **Image Tag** or **Replica Count** without editing the files. 
We use `values.yaml`.

## The Task
1.  Edit `charts/kubeshop/values.yaml`:
    ```yaml
    frontend:
      replicas: 2
      image: kubeshop/frontend:v1
    ```
2.  Edit `charts/kubeshop/templates/frontend-deployment.yaml`:
    -   Replicas: `{{ .Values.frontend.replicas }}`
    -   Image: `{{ .Values.frontend.image }}`
3.  Upgrade the release:
    `helm upgrade kubeshop ./charts/kubeshop`
4.  Verify:
    `kubectl get deploy frontend -o jsonpath='{.spec.replicas}'` (Should be 2).

## Verification
Run `./check.sh`.
