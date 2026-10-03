# Task 4 - Infrastructure as Code & Kubernetes Orchestration

## Objective

Provision and orchestrate a local highly available microservices environment
using Terraform and Kubernetes (Minikube).

> Note: The project was implemented locally using Minikube because no cloud
> account was available. Terraform was used to provision Kubernetes
> infrastructure resources, while Kubernetes manifests deploy the application
> workloads.

---

## Architecture

The application consists of:

- React Frontend
- FastAPI Backend
- PostgreSQL Database
- Kubernetes Services
- Persistent Volume Claim
- NGINX Ingress Controller
- Horizontal Pod Autoscaler
- Terraform-managed Kubernetes infrastructure

Architecture flow:

```text
                    Internet / Browser
                           |
                           v
                  NGINX Ingress
                           |
                           v
              task-manager-frontend
                    ClusterIP :80
                           |
                           v
                 Frontend Pods (2)
                           |
                      /api/*
                           |
                           v
               task-manager-backend
                    ClusterIP :8000
                           |
                           v
                 Backend Pods (2-5)
                           |
                           v
                    PostgreSQL
                    ClusterIP :5432
                           |
                           v
                  PostgreSQL PVC
                       1Gi RWO