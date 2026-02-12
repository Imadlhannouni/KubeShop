# Lab 36: Policy as Code (Security)

## Objective
We want to prevent "bad" things from happening.
Real Platform Engineering uses **OPA Gatekeeper** to ban `latest` tags or `root` users.
For this lab, let's enforce a **Deny All** Network Policy on the `monitoring` namespace to secure our metrics.

## The Task
1.  Create `monitor-netpol.yaml`.
2.  Kind: `NetworkPolicy`.
3.  Namespace: `monitoring`.
4.  PodSelector: `{}` (Select all).
5.  PolicyTypes: `["Ingress"]`.
6.  Ingress: `[]` (Allow nothing external, but maybe allow from localhost if needed). 
    *Actually, let's allow access only from the `default` namespace.*
    ```yaml
    ingress:
    - from:
      - namespaceSelector:
          matchLabels:
            kubernetes.io/metadata.name: default
    ```
7.  Apply it.

## Verification
Run `./check.sh`.
