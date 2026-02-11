# Lab 16: Network Policies (Deny All)

## Objective
By default, all Pods can talk to all other Pods. In production, this is a security risk.
We want to implement a **Zero Trust** network. First step: Deny Everything.

## Prerequisites
*Note: Network Policies require a specific CNI (like Calico/Cilium). If you are using standard Minikube/Kind without a custom CNI, these resources will be created but might not actually block traffic. That's okay for learning the syntax!*

## The Task
1.  Create `deny-all.yaml`.
2.  Define a `NetworkPolicy` named `default-deny-all`.
3.  Spec:
    -   `podSelector`: `{}` (Selects all pods).
    -   `policyTypes`: `["Ingress"]`.
    -   `ingress`: `[]` (Empty list means block all).
4.  Apply it.

## Verification
Run `./check.sh`.
