# Lab 01: Docker Basics

## Objective
Learn how to build a container image from source code and run it locally. This is the foundation of everything in Kubernetes.

## The Task
1.  Navigate to `src/catalog`.
2.  Examine the `Dockerfile`.
3.  Build the image with the tag `kubeshop/catalog:v1`.
4.  Run the container on port `8080`.
5.  Verify it works by curling `localhost:8080/products`.

## Commands to Use
-   `docker build ...`
-   `docker run ...`

## Verification
If you see a JSON list of products, you succeeded!

## Hints
-   Don't forget the `.` at the end of the build command.
-   Use `-p` to map host ports to container ports.
