# Lab 30: Installing ArgoCD

## Objective
**GitOps** means "Git is the source of truth".
We need a controller that watches Git and updates the cluster. **ArgoCD** is the industry standard.

## The Task
1.  Create a namespace:
    `kubectl create namespace argocd`
2.  Install ArgoCD (using their official manifest):
    `kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml`
3.  Watch it start:
    `kubectl get pods -n argocd`
4.  **Access the UI**:
    -   We need to patch the service to NodePort (or use port-forward).
    -   `kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'`
    -   Get the password:
        `kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`
    -   Login (Simulation): Just verify it's running for now.

## Verification
Run `./check.sh`.
