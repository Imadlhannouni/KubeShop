# 🎓 KubeShop Learning Path

Welcome to your **KodeKloud-style** local environment.
This file is your map. Follow the labs in order.

## 🟢 Module 1: The Container Foundation
*Learn the basics of Docker and Pods.*

- [ ] **[Lab 01: Docker Basics](./labs/01-docker/instructions.md)**
    - **Goal**: Build and run the Catalog service container.
    - **Verify**: Run `./labs/01-docker/check.sh`

- [ ] **[Lab 02: Docker Networking](./labs/02-docker-network/instructions.md)**
    - **Goal**: Connect Frontend to Catalog using Docker Network.
    - **Verify**: Run `./labs/02-docker-network/check.sh`

- [ ] **[Lab 03: The First Pod](./labs/03-first-pod/instructions.md)**
    - **Goal**: Deploy your first Kubernetes Pod.
    - **Verify**: Run `./labs/03-first-pod/check.sh`

- [ ] **[Lab 04: Sidecars](./labs/04-sidecar/instructions.md)**
    - **Goal**: Add a helper container to your Pod.
    - **Verify**: Run `./labs/04-sidecar/check.sh`

## 🟡 Module 2: Controllers
*Scaling and Self-Healing*

- [ ] **[Lab 05: ReplicaSets](./labs/05-replicaset/instructions.md)**
    - **Goal**: Ensure 3 pods are always running.
    - **Verify**: Run `./labs/05-replicaset/check.sh`

- [ ] **[Lab 06: Deployments](./labs/06-deployment/instructions.md)**
    - **Goal**: Manage declarative updates.
    - **Verify**: Run `./labs/06-deployment/check.sh`

- [ ] **[Lab 07: Rolling Updates](./labs/07-rolling-update/instructions.md)**
    - **Goal**: Update app version with zero downtime.
    - **Verify**: Run `./labs/07-rolling-update/check.sh`

- [ ] **[Lab 09: Health Probes](./labs/09-liveness/instructions.md)**
    - **Goal**: Configure Liveness and Readiness probes to fix stuck apps.
    - **Verify**: Run `./labs/09-liveness/check.sh`

## 🟠 Module 3: Networking
*Services and External Access*

- [ ] **[Lab 11: ClusterIP Service](./labs/11-clusterip/instructions.md)**
    - **Goal**: Create internal stable IP for Catalog.
    - **Verify**: Run `./labs/11-clusterip/check.sh`

- [ ] **[Lab 12: NodePort Service](./labs/12-nodeport/instructions.md)**
    - **Goal**: Expose Frontend to your host machine.
    - **Verify**: Run `./labs/12-nodeport/check.sh`

- [ ] **[Lab 14: Ingress](./labs/14-ingress/instructions.md)**
    - **Goal**: Expose app via `kubeshop.local` domain.
    - **Verify**: Run `./labs/14-ingress/check.sh`

- [ ] **[Lab 16: Deny All Traffic](./labs/16-netpol-deny/instructions.md)**
    - **Goal**: Implement Zero Trust (Lockdown).
    - **Verify**: Run `./labs/16-netpol-deny/check.sh`

- [ ] **[Lab 17: Allow Traffic](./labs/17-netpol-allow/instructions.md)**
    - **Goal**: Explicitly allow Frontend -> Catalog.
    - **Verify**: Run `./labs/17-netpol-allow/check.sh`


