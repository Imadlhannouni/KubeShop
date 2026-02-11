# Lab 17: Network Policies (Allow)

## Objective
We denied all traffic. Now the Frontend is broken because it can't call the Catalog.
We need to **Allow** specifically `Frontend -> Catalog`.

## The Task
1.  Create `allow-catalog.yaml`.
2.  Define a `NetworkPolicy` named `allow-frontend-to-catalog`.
3.  `podSelector`: `app: catalog` (Apply this policy TO the Catalog).
4.  `policyTypes`: `["Ingress"]`.
5.  `ingress`:
    -   `from`:
        -   `podSelector`: `app: frontend` (Allow traffic FROM Frontend).
    -   `ports`:
        -   `port`: `8080`.
6.  Apply it.

## Verification
Run `./check.sh`.
