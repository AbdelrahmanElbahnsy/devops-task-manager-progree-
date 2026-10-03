# 🚀 Task Manager - DevOps Project

> A full-stack Task Manager application built with React, FastAPI, and PostgreSQL, containerized with Docker, and deployed on Kubernetes using Minikube with persistent storage, NGINX Ingress, Horizontal Pod Autoscaling, and Terraform Infrastructure as Code.

---

## 📌 Overview

Task Manager is a full-stack web application designed and deployed using modern DevOps practices.

The project demonstrates the complete application lifecycle from local containerization to Kubernetes orchestration and Infrastructure as Code.

The application includes:

- React + Vite frontend
- FastAPI backend
- PostgreSQL database
- Docker containerization
- Docker Compose for local development
- Kubernetes orchestration using Minikube
- Kubernetes Services
- Persistent Volume Claim (PVC)
- NGINX Ingress Controller
- Horizontal Pod Autoscaler (HPA)
- Kubernetes Metrics Server
- Terraform Infrastructure as Code
- Git and GitHub

The application was successfully deployed and tested on a local Kubernetes cluster.

---

## ✨ Features

- Create tasks
- Display tasks
- Delete tasks
- Persistent PostgreSQL storage
- REST API using FastAPI
- React frontend
- Dockerized application
- Docker Compose support
- Kubernetes deployment
- Multiple frontend replicas
- Multiple backend replicas
- Kubernetes Services
- Persistent Volume Claim (PVC)
- NGINX Ingress
- CPU-based Horizontal Pod Autoscaling (HPA)
- Kubernetes Metrics Server
- Terraform Infrastructure as Code
- Local Kubernetes environment using Minikube
- Infrastructure resource management using Terraform
- Container orchestration using Kubernetes
- Persistent database storage
- Scalable backend architecture
- Automatic backend scaling based on CPU utilization

---

## 🛠️ Technology Stack

| Category | Technology |
|---|---|
| Frontend | React, Vite |
| Backend | Python, FastAPI |
| Database | PostgreSQL 16 |
| Web Server | NGINX |
| Containers | Docker |
| Local Development | Docker Compose |
| Orchestration | Kubernetes |
| Local Kubernetes | Minikube |
| Ingress | NGINX Ingress Controller |
| Autoscaling | Kubernetes HPA |
| Metrics | Kubernetes Metrics Server |
| Infrastructure as Code | Terraform |
| Version Control | Git, GitHub |

---

## 🏗️ Architecture

```text
                         ┌─────────────────┐
                         │     Browser     │
                         └────────┬────────┘
                                  │
                                  ▼
                       ┌─────────────────────┐
                       │   NGINX Ingress     │
                       │      Controller     │
                       └──────────┬──────────┘
                                  │
                                  ▼
                    ┌──────────────────────────┐
                    │   Frontend Service       │
                    │      ClusterIP :80       │
                    └────────────┬─────────────┘
                                 │
                          ┌──────┴──────┐
                          ▼             ▼
                    Frontend Pod   Frontend Pod
                          │             │
                          └──────┬──────┘
                                 │
                               /api
                                 │
                                 ▼
                    ┌──────────────────────────┐
                    │   Backend Service        │
                    │     ClusterIP :8000      │
                    └────────────┬─────────────┘
                                 │
                          ┌──────┴──────┐
                          ▼             ▼
                    Backend Pod    Backend Pod
                          │             │
                          └──────┬──────┘
                                 │
                                 ▼
                    ┌──────────────────────────┐
                    │   PostgreSQL Service     │
                    │     ClusterIP :5432      │
                    └────────────┬─────────────┘
                                 │
                                 ▼
                    ┌──────────────────────────┐
                    │      PostgreSQL Pod       │
                    └────────────┬─────────────┘
                                 │
                                 ▼
                    ┌──────────────────────────┐
                    │    Persistent Volume      │
                    │          1Gi PVC           │
                    └──────────────────────────┘

                         ┌─────────────────┐
                         │    Terraform    │
                         │      IaC        │
                         └────────┬────────┘
                                  │
                                  ▼
                     Kubernetes Infrastructure
                     ├── Namespace
                     └── Resource Quota

                         ┌─────────────────┐
                         │ Metrics Server  │
                         └────────┬────────┘
                                  │
                                  ▼
                         ┌─────────────────┐
                         │      HPA        │
                         │    2 → 5 Pods   │
                         └─────────────────┘
```

---

## 📂 Project Structure

```text
task-manager-progree/
│
├── backend/
│   ├── Dockerfile
│   ├── requirements.txt
│   └── ...
│
├── frontend/
│   ├── Dockerfile
│   ├── nginx.conf
│   ├── package.json
│   └── ...
│
├── k8s/
│   ├── backend/
│   │   ├── backend.yaml
│   │   └── hpa.yaml
│   │
│   ├── frontend/
│   │   └── frontend.yaml
│   │
│   ├── ingress/
│   │   └── ingress.yaml
│   │
│   └── postgres/
│       ├── postgres.yaml
│       └── postgres-pvc.yaml
│
├── terraform/
│   ├── main.tf
│   ├── namespace.tf
│   ├── resource-quota.tf
│   └── .terraform.lock.hcl
│
├── TASK4.md
├── docker-compose.yml
├── .env.example
├── .gitignore
└── README.md
```

---

## 🐳 Docker

The application can be started locally using Docker Compose.

Docker Compose contains three main services:

```text
Frontend
   │
   └── React + NGINX

Backend
   │
   └── FastAPI

Database
   │
   └── PostgreSQL
```

### Start the application

```bash
docker compose up -d --build
```

### Check containers

```bash
docker compose ps
```

### Stop containers

```bash
docker compose down
```

---

## 🌐 Docker Compose Access

When running with Docker Compose:

```text
Frontend:
http://localhost:3000

Backend:
http://localhost:8000

PostgreSQL:
localhost:5433
```

---

# ☸️ Kubernetes Deployment

The application is deployed on a local Kubernetes cluster using Minikube.

### Start Minikube

```bash
minikube start
```

### Check Minikube

```bash
minikube status
```

### Check Kubernetes nodes

```bash
kubectl get nodes
```

---

## 📦 Docker Images in Minikube

The application uses local Docker images.

Load the backend image:

```bash
minikube image load task-manager-progree-backend:latest
```

Load the frontend image:

```bash
minikube image load task-manager-progree-frontend:k8s
```

---

# 🗄️ PostgreSQL

PostgreSQL is deployed as a Kubernetes Deployment with a ClusterIP Service.

PostgreSQL configuration:

```text
Database:
taskmanager

User:
taskuser

Port:
5432
```

Deploy PostgreSQL:

```bash
kubectl apply -f k8s/postgres/postgres-pvc.yaml
kubectl apply -f k8s/postgres/postgres.yaml
```

Check PostgreSQL:

```bash
kubectl get pods
kubectl get svc
```

---

# 💾 Persistent Volume Claim

PostgreSQL uses a Kubernetes PersistentVolumeClaim.

Configuration:

```text
Storage:
1Gi

Access Mode:
ReadWriteOnce

Storage Class:
standard
```

Check the PVC:

```bash
kubectl get pvc
```

Expected status:

```text
postgres-pvc   Bound
```

The PVC provides persistent storage for PostgreSQL data.

---

# 🔧 Backend

The FastAPI backend is deployed with two replicas.

Deploy the backend:

```bash
kubectl apply -f k8s/backend/backend.yaml
```

Backend configuration:

```text
Replicas:
2

Container Port:
8000

Service:
ClusterIP

CPU Request:
100m

CPU Limit:
500m

Memory Request:
128Mi

Memory Limit:
256Mi
```

Check the backend:

```bash
kubectl get deployment task-manager-backend
kubectl get pods
kubectl get svc
```

---

# 🎨 Frontend

The React frontend is built using Vite and served using NGINX.

Deploy the frontend:

```bash
kubectl apply -f k8s/frontend/frontend.yaml
```

Frontend configuration:

```text
Replicas:
2

Container Port:
80

Service:
ClusterIP
```

The NGINX configuration proxies API requests to:

```text
task-manager-backend:8000
```

Check the frontend:

```bash
kubectl get deployment task-manager-frontend
kubectl get pods
kubectl get svc
```

---

# 🌐 NGINX Ingress

The application uses the Kubernetes NGINX Ingress Controller.

Enable the Minikube Ingress addon:

```bash
minikube addons enable ingress
```

Apply the Ingress configuration:

```bash
kubectl apply -f k8s/ingress/ingress.yaml
```

Check the Ingress:

```bash
kubectl get ingress
```

The local Minikube environment provides an Ingress address similar to:

```text
192.168.49.2
```

The Ingress routes incoming requests to the frontend service.

---

# 📈 Horizontal Pod Autoscaler

The backend uses Kubernetes Horizontal Pod Autoscaler.

The HPA configuration is located at:

```text
k8s/backend/hpa.yaml
```

Configuration:

```text
Minimum Replicas:
2

Maximum Replicas:
5

CPU Target:
50%
```

Enable Metrics Server:

```bash
minikube addons enable metrics-server
```

Check metrics:

```bash
kubectl top pods
```

Apply HPA:

```bash
kubectl apply -f k8s/backend/hpa.yaml
```

Check HPA:

```bash
kubectl get hpa
```

Example:

```text
NAME                       TARGETS   MINPODS   MAXPODS   REPLICAS
task-manager-backend-hpa   2%/50%    2         5         2
```

The backend can automatically scale between 2 and 5 replicas depending on CPU utilization.

---

# 🏗️ Terraform Infrastructure as Code

Terraform is used to manage Kubernetes infrastructure resources locally.

Terraform configuration:

```text
terraform/
├── main.tf
├── namespace.tf
├── resource-quota.tf
└── .terraform.lock.hcl
```

Terraform provisions:

- Kubernetes Namespace
- Kubernetes Resource Quota

## Terraform Initialization

```bash
cd terraform
terraform init
```

## Terraform Plan

```bash
terraform plan
```

## Terraform Apply

```bash
terraform apply
```

Terraform provisions:

```text
Namespace:
task-manager

Resource Quota:
task-manager-quota
```

The Resource Quota contains:

```text
Pods:
20

CPU Requests:
2

Memory Requests:
2Gi

CPU Limits:
4

Memory Limits:
4Gi
```

Verify the namespace:

```bash
kubectl get namespace task-manager
```

Verify the Resource Quota:

```bash
kubectl get resourcequota -n task-manager
```

Terraform result:

```text
Apply complete!
Resources: 2 added, 0 changed, 0 destroyed.
```

> The project was implemented locally using Minikube because the development environment did not require a cloud account. Terraform manages Kubernetes infrastructure resources in this local environment.

---

# 🔍 Kubernetes Verification

Check all application Pods:

```bash
kubectl get pods
```

Check Services:

```bash
kubectl get svc
```

Check Persistent Storage:

```bash
kubectl get pvc
```

Check Ingress:

```bash
kubectl get ingress
```

Check HPA:

```bash
kubectl get hpa
```

Check resource utilization:

```bash
kubectl top pods
```

---

# 🧪 Application Verification

The application was successfully tested on Kubernetes.

Current deployment state:

```text
PostgreSQL:
1/1 Running

Backend:
2/2 Running

Frontend:
2/2 Running

PostgreSQL PVC:
Bound

Ingress:
Active

Metrics Server:
Active

HPA:
Active
```

The frontend communicates with the FastAPI backend through the Kubernetes Service:

```text
task-manager-backend:8000
```

---

# ⚙️ Kubernetes Configuration

## Frontend

```text
Replicas: 2
Port: 80
Service Type: ClusterIP
Web Server: NGINX
```

## Backend

```text
Replicas: 2
Autoscaling: 2 → 5
Port: 8000
Service Type: ClusterIP

CPU Request: 100m
CPU Limit: 500m

Memory Request: 128Mi
Memory Limit: 256Mi
```

## PostgreSQL

```text
Image: postgres:16-alpine
Port: 5432
Service Type: ClusterIP
Storage: 1Gi
Access Mode: ReadWriteOnce
```

## Horizontal Pod Autoscaler

```text
Minimum Replicas: 2
Maximum Replicas: 5
CPU Target: 50%
```

## Terraform

```text
Provider: Kubernetes
Namespace: task-manager
Resource Quota: task-manager-quota
```

---

# 🔄 DevOps Workflow

```text
Developer
    │
    ▼
GitHub Repository
    │
    ▼
Docker
    │
    ▼
Docker Compose
    │
    ▼
Kubernetes / Minikube
    │
    ├── Frontend
    ├── Backend
    └── PostgreSQL
             │
             ▼
       Persistent Storage

Kubernetes
    │
    ├── Services
    ├── NGINX Ingress
    ├── Metrics Server
    └── HPA
             │
             ▼
       Automatic Scaling

Terraform
    │
    ▼
Infrastructure as Code
    │
    ├── Kubernetes Namespace
    └── Resource Quota
```

---

# 📋 PROGREE DevOps Tasks

This project was developed as part of the PROGREE DevOps tasks.

| Task | Description | Status |
|---|---|---|
| Task 1 | Professional LinkedIn Announcement | ✅ Completed |
| Task 2 | Application Containerization & Asset Optimization | ✅ Completed |
| Task 3 | Automated CI/CD Deployment Pipeline | ✅ Completed |
| Task 4 | Infrastructure as Code & Kubernetes Orchestration | ✅ Completed |

---

# 📌 Task 4 Implementation

Task 4 focuses on Infrastructure as Code and Kubernetes orchestration.

Implemented components:

- Terraform Infrastructure as Code
- Kubernetes / Minikube
- Containerized application deployment
- PostgreSQL
- Persistent Volume Claim
- Kubernetes Services
- NGINX Ingress Controller
- Horizontal Pod Autoscaler
- Metrics Server
- Multiple frontend replicas
- Multiple backend replicas

The local implementation provides a Kubernetes-based environment with persistent storage, ingress routing, multiple application replicas, resource management, and CPU-based autoscaling.

---

# 🚀 Quick Start

## Docker Compose

```bash
docker compose up -d --build
```

Open:

```text
http://localhost:3000
```

## Kubernetes

Start Minikube:

```bash
minikube start
```

Enable required addons:

```bash
minikube addons enable ingress
minikube addons enable metrics-server
```

Load local images:

```bash
minikube image load task-manager-progree-backend:latest
minikube image load task-manager-progree-frontend:k8s
```

Deploy PostgreSQL:

```bash
kubectl apply -f k8s/postgres/postgres-pvc.yaml
kubectl apply -f k8s/postgres/postgres.yaml
```

Deploy Backend:

```bash
kubectl apply -f k8s/backend/backend.yaml
```

Deploy Frontend:

```bash
kubectl apply -f k8s/frontend/frontend.yaml
```

Deploy HPA:

```bash
kubectl apply -f k8s/backend/hpa.yaml
```

Deploy Ingress:

```bash
kubectl apply -f k8s/ingress/ingress.yaml
```

Initialize Terraform:

```bash
cd terraform
terraform init
```

Review infrastructure:

```bash
terraform plan
```

Apply infrastructure:

```bash
terraform apply
```

Verify the environment:

```bash
kubectl get pods
kubectl get svc
kubectl get pvc
kubectl get ingress
kubectl get hpa
kubectl top pods
```

---

# 🔐 Environment Variables

Sensitive environment variables are not committed to GitHub.

The project uses:

```text
.env
.env.example
```

The `.env` file is excluded through `.gitignore`.

Example configuration:

```env
APP_ENV=production
BACKEND_PORT=8000
FRONTEND_PORT=3000
```

---

# 📊 Project Highlights

This project demonstrates practical hands-on experience with:

- Docker
- Docker Compose
- Kubernetes
- Minikube
- NGINX
- PostgreSQL
- Persistent Volumes
- Kubernetes Services
- Ingress
- Metrics Server
- Horizontal Pod Autoscaler
- Terraform
- Infrastructure as Code
- Git
- GitHub
- Container orchestration
- Application scaling
- Persistent database storage

---

# 👨‍💻 Author

**Abdelrahman Mohamed El-bahnsy**

Cloud & DevOps Engineer

GitHub:
(https://github.com/AbdelrahmanElbahnsy)

---

## ⭐ Project Summary

```text
React + FastAPI + PostgreSQL
            │
            ▼
       Docker / Compose
            │
            ▼
    Kubernetes / Minikube
            │
     ┌──────┼──────┐
     ▼      ▼      ▼
 Frontend Backend PostgreSQL
    │        │        │
    │        │        ▼
    │        │       PVC
    │        │
    │        ▼
    │       HPA
    │
    ▼
  NGINX
 Ingress

            +
            
        Terraform
            │
            ▼
 Infrastructure as Code
```

---
