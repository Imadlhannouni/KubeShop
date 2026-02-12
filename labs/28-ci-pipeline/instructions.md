# Lab 28: The CI/CD Pipeline

## Objective
In a real enterprise, you don't run `helm install` from your laptop.
A **CI Server** (GitHub Actions, Jenkins) does it.
Let's create a "Mock CI" script that automates the release process.

## The Task
1.  Create `ci.sh`.
2.  It should accept a version as an argument (e.g., `./ci.sh v2`).
3.  **Step 1: Lint**: Run `helm lint charts/kubeshop`.
4.  **Step 2: Build**: (Mock) `echo "Building Docker image kubeshop/frontend:$1..."`.
5.  **Step 3: Deploy**: Run `helm upgrade --install kubeshop ./charts/kubeshop --set frontend.image=kubeshop/frontend:$1`.
6.  Run it: `./ci.sh v2`.

## Verification
Run `./check.sh`.
