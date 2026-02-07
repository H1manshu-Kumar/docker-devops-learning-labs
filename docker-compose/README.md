# Docker Compose – Hands-on Learning Track

This directory contains **hands-on Docker Compose examples** that demonstrate how containerized applications can be orchestrated using **declarative configuration**.

The focus is on **learning progression**, starting from a single-container setup and moving toward a **real-world multi-service full-stack application**.

---

## Purpose of This Section

- Understand Docker Compose fundamentals through hands-on practice
- Move from `docker run` commands to declarative YAML-based orchestration
- Learn service orchestration, networking, and lifecycle management
- Build DevOps-ready, interview-friendly examples using real applications

---

## Folder Structure Overview

```text
docker-compose/
├── 01-single-service
│   ├── docker-compose.yml
│   ├── README.md
│   └── tic-tac-toe-nginx-game
│
└── 02-multi-service-full-stack-app
    ├── docker-compose.yml
    ├── README.md
    └── Task-Manager-App
```

---

## Learning Progression

### 01 – Single Service

**Folder:** `01-single-service`

**What is covered**
- Docker Compose basics
- Single container orchestration
- Port mapping using Compose
- Replacing `docker run` with declarative configuration

**Application Used**
- Tic-Tac-Toe game served via Nginx
- Multi-stage + distroless Docker image

**How to run**
```bash
cd 01-single-service
docker compose up
```

---

### 02 – Multi-Service Full Stack Application

**Folder:** `02-multi-service-full-stack-app`

**What is covered**
- Multi-container orchestration
- Frontend, backend, and database services
- Docker Compose networking
- Service-name-based communication
- Dependency management using `depends_on`

**Application Used**
- Task Manager full-stack application
- Separate frontend and database services

**How to run**
```bash
cd 02-multi-service-full-stack-app
docker compose up
```

---

## Key Docker Compose Concepts Demonstrated

- Declarative service definitions
- Built-in networking and DNS resolution
- Port exposure and service isolation
- Container lifecycle management
- Reproducible local environments

---

## DevOps & QA Perspective

- Mirrors real-world local development and QA environments
- Reduces environment setup complexity
- Improves reproducibility across teams
- Same declarative mindset used in Kubernetes
- Useful for CI pipelines and integration testing

---

## How This Repo Should Be Used

- Each folder is **self-contained**
- Read the README inside each folder before running
- Progress in order to understand Compose concepts incrementally
- Treat Compose files as Infrastructure-as-Code

---

## Next Logical Steps After Docker Compose

- Docker volumes and data persistence
- Docker Scout and container security
- Kubernetes (reusing the same applications)
- CI/CD pipelines using Docker Compose for testing

---

## Author

**Himanshu Kumar**  
Docker & DevOps Hands-on Learning

