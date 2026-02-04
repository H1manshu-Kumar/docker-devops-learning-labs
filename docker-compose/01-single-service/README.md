# Docker Compose – Single Service Setup

This module demonstrates how to run a **single-container application** using **Docker Compose**, replacing manual `docker run` commands with a **declarative configuration**.

The existing **tic-tac-toe Nginx application** is reused to show how Docker Compose simplifies container lifecycle management.

---

## Objective

- Learn Docker Compose fundamentals
- Run a single service using `docker-compose.yml`
- Replace imperative Docker commands with declarative configuration
- Build a strong foundation for multi-service orchestration

---

## Application Used

- **Application**: Tic-Tac-Toe Game
- **Web Server**: Nginx
- **Dockerfile**: Multi-stage + Distroless
- **Type**: Single container application

---

## Folder Structure

```
01-single-service/
├── docker-compose.yml
├── README.md
└── tic-tac-toe-nginx-game/
```

---

## Docker Compose Configuration

```yaml
services:
  tic-tac-toe:
    image: tic-tac-toe
    container_name: tic-tac-toe-container
    ports:
      - "8181:8080"
    build:
      context: ./tic-tac-toe-nginx-game
      dockerfile: Dockerfile-multi-stage-distroless
```

---

## Configuration Explanation

- **services** → Defines the container managed by Docker Compose
- **image** → Name of the Docker image built by Compose
- **container_name** → Custom name for easier container management
- **ports** → Maps host port `8181` to container port `8080`
- **build.context** → Directory containing application source code
- **dockerfile** → Multi-stage distroless Dockerfile for optimized images

---

## How to Run

Navigate to the `01-single-service` directory and run:

```bash
docker compose up
```

To run in detached mode:

```bash
docker compose up -d
```

---

## Access the Application

Open a browser and visit:

```
http://localhost:8181
```

---

## docker run vs Docker Compose

| docker run | Docker Compose |
|----------|----------------|
| Imperative commands | Declarative YAML |
| Long CLI commands | Clean configuration file |
| Hard to reproduce | Version controlled |
| Manual lifecycle | Managed lifecycle |

---

## Key Learnings

- Docker Compose service definition
- Port mapping using Compose
- Declarative container lifecycle management
- Reusing existing Docker applications
- Cleaner and repeatable local environment setup

---

## Observations

- Same declarative mindset as Kubernetes manifests
- Useful for local development, QA, and CI environments
- Reduces environment drift across teams
- Improves onboarding and reproducibility

---

## ✍️ Author

**[Himanshu Kumar](https://www.linkedin.com/in/h1manshu-kumar/)** - Learning by building, documenting, and sharing 🚀
