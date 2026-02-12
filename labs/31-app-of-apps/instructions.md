# Lab 31: The GitOps Application

## Objective
Now that ArgoCD is running, let's tell it to manage **KubeShop**.
We define an `Application` CRD that points to our Helm Chart.

## The Task
1.  Create `application.yaml`.
2.  Define:
    ```yaml
    apiVersion: argoproj.io/v1alpha1
    kind: Application
    metadata:
      name: kubeshop
      namespace: argocd
    spec:
      project: default
      source:
        repoURL: https://github.com/Imadlhannouni/KubeShop.git
        targetRevision: master # or HEAD
        path: charts/kubeshop
      destination:
        server: https://kubernetes.default.svc
        namespace: default
      syncPolicy:
        automated:
          prune: true
          selfHeal: true
    ```
3.  Apply it: `kubectl apply -f application.yaml`.
4.  Check status: `kubectl get app -n argocd`.

## Verification
Run `./check.sh`.
