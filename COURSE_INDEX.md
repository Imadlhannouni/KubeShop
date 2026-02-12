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

## 🟣 Module 4: Configuration
*The 12-Factor App*

- [ ] **[Lab 18: Environment Variables](./labs/18-env-vars/instructions.md)**
    - **Goal**: Inject `CATALOG_URL` dynamically.
    - **Verify**: Run `./labs/18-env-vars/check.sh`

- [ ] **[Lab 19: ConfigMaps](./labs/19-configmaps/instructions.md)**
    - **Goal**: Centralize configuration in a file.
    - **Verify**: Run `./labs/19-configmaps/check.sh`

- [ ] **[Lab 20: Secrets](./labs/20-secrets/instructions.md)**
    - **Goal**: Manage sensitive API keys.
    - **Verify**: Run `./labs/20-secrets/check.sh`

## 📦 Module 5: Storage
*Persistence*

- [ ] **[Lab 21: Ephemeral Storage](./labs/21-emptydir/instructions.md)**
    - **Goal**: Understand `emptyDir`.
    - **Verify**: Run `./labs/21-emptydir/check.sh`

- [ ] **[Lab 22: PersistentVolumes](./labs/22-pv/instructions.md)**
    - **Goal**: Create a manual PV.
    - **Verify**: Run `./labs/22-pv/check.sh`

- [ ] **[Lab 23: PVCs](./labs/23-pvc/instructions.md)**
    - **Goal**: Claim storage for your app.
    - **Verify**: Run `./labs/23-pvc/check.sh`

- [ ] **[Lab 24: Using Storage](./labs/24-storageclass/instructions.md)**
    - **Goal**: Mount PVC to a Pod.
    - **Verify**: Run `./labs/24-storageclass/check.sh`

## 🛳️ Module 5: Automation (Helm)
*Package Management*

- [ ] **[Lab 25: Helm Basics](./labs/25-helm-basics/instructions.md)**
    - **Goal**: Install Redis with Helm.
    - **Verify**: Run `./labs/25-helm-basics/check.sh`

- [ ] **[Lab 26: Create a Chart](./labs/26-create-chart/instructions.md)**
    - **Goal**: Package KubeShop as a Chart.
    - **Verify**: Run `./labs/26-create-chart/check.sh`

- [ ] **[Lab 27: Helm Values](./labs/27-helm-values/instructions.md)**
    - **Goal**: Parameterize your deployment.
    - **Verify**: Run `./labs/27-helm-values/check.sh`





