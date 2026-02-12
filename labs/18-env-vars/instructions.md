# Lab 18: Environment Variables (The 12-Factor App)

## Objective
The **12-Factor App** methodology states: *"Store config in the environment"*.
Hardcoding URLs (like `http://localhost:8080`) is bad.
We need to tell the **Frontend** where the **Catalog** is using an Environment Variable.

## The Task
1.  Create `frontend-env.yaml`.
2.  Define a `Deployment` for the frontend.
3.  Add the `env` section to the container spec.
4.  Name: `CATALOG_URL`.
5.  Value: `http://catalog-service` (The internal DNS name we created in Lab 11).
6.  Apply it.

## Verification
Run `./check.sh`.
It will inspect the running pod to see if the ENV var is set correctly.
