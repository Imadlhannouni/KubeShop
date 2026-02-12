# Lab 20: Secrets

## Objective
Passwords and API Keys should NEVER be valid text in a ConfigMap.
Kubernetes **Secrets** are base64 encoded (and can be encrypted at rest).
Let's add a fake "Payment API Key" to the Order service.

## The Task
1.  Create `secret.yaml`.
2.  Define a `Secret` named `payment-secret`.
3.  Type: `Opaque` (default).
4.  Data (Must be Base64 encoded!):
    -   `api_key`: `c3VwZXJzZWNyZXQ=` (which decodes to "supersecret")
    -   *Tip: `echo -n "supersecret" | base64`*
5.  Update `payment-deployment.yaml` (or create one for `order` service).
6.  Inject it as an ENV var named `PAYMENT_KEY`.

## Verification
Run `./check.sh`.
