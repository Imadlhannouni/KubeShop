# Lab 03: The First Pod

## Objective
Move from Docker to Kubernetes. Run the **Catalog** service as a Pod in the cluster.

## The Task
1.  Edit the file `pod.yaml`.
2.  Define a Pod named `catalog-pod`.
3.  Use the image `kubeshop/catalog:v1`.
    *   **Note**: Since we built this image locally, you might need to set `imagePullPolicy: Never` if using Minikube/Kind with direct image loading, OR push it to a registry. For simplicity, assume `imagePullPolicy: IfNotPresent` or `Never`.
4.  Apply the manifest to the cluster.
5.  Check the status of the pod.
6.  Port-forward port 8080 to your local machine to verify it works.

## Commands
-   `kubectl apply -f ...`
-   `kubectl get pods`
-   `kubectl port-forward ...`

## Verification
`curl localhost:8080/products` should return the JSON list.
