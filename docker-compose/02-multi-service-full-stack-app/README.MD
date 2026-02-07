# Docker Compose - Multi-Service Full Stack Application

This module demonstrates a **multi-service full-stack application** orchestrated using **Docker Compose**.

It builds upon previous Docker Compose learnings (single-service and basic multi-service) and shows how a **frontend and database** can be managed together as a single stack.

---

## Objective

- Understand Docker Compose for full-stack applications
- Orchestrate multiple dependent services together
- Learn service-to-service communication using Compose networking
- Manage the complete application lifecycle with a single command

---

## Architecture Overview

```text
Client (Browser)
      |
      v
Frontend Service
      |
      v
Backend Service
      |
      v
Database Service
```

All services run on the same Docker Compose network and communicate using **service names**, not IP addresses.

---

## Folder Structure

```text
02-multi-service-full-stack-app/
├── Tast-Manager-App/
      ├── frontend/
      ├── database/
      └── README.md
├── docker-compose.yml
└── README.md

```

---

## Docker Compose Concepts Used

- Multi-service orchestration
- Built-in Docker Compose networking
- Service-name-based DNS resolution
- Container dependency management
- Centralized lifecycle management

---

## Docker Compose Configuration Overview

```yaml
services:
  task-db:
    image: task-db:latest
    container_name: task-db-container
    environment:
      POSTGRES_DB: taskdb
      POSTGRES_USER: taskuser
      POSTGRES_PASSWORD: taskpass
    build:
      context: ./02-multi-service-full-stack-app/Task-Manager-App/database
      dockerfile: Dockerfile
    volumes:
      - ./postgresql:/var/lib/postgresql    
    networks:
      - task-network
  task-app:
    image: task-app:latest
    container_name: task-app-container
    environment:
      DB_HOST: task-db\
      DB_NAME: taskdb
      DB_USER: taskuser
      DB_PASS: taskpass
    build:
      context: ./02-multi-service-full-stack-app/Task-Manager-App/frontend
      dockerfile: Dockerfile
    networks:
      - task-network
    ports:
      - "3000:3000"
    depends_on:
      - task-db
    restart: always

volumes:
  postgresql:

networks:
  task-network:

```

> Note: Docker Compose automatically creates a shared bridge network for all services defined in the file.

---

## How to Run the Full Stack

Navigate to the project directory:

```bash
cd docker-compose/02-multi-service-full-stack-app
docker compose up
```

To run in detached mode:

```bash
docker compose up -d
```

---

## Access the Application

- **Task-Manager-App**: http://localhost:3000    

(The database runs internally and is not exposed publicly.)

---

## Key Learnings

- Running multiple services with a single `docker compose up`
- Understanding service dependencies using `depends_on`
- Docker Compose networking and internal DNS
- Separation of concerns between frontend, backend, and database
- Declarative definition of a full-stack environment

---

## docker run vs Docker Compose (Full Stack)

| docker run | Docker Compose |
|-----------|----------------|
| Multiple commands | Single command |
| Manual networks | Automatic networking |
| Hard to manage dependencies | Built-in dependency handling |
| Error-prone setup | Repeatable & version controlled |

---

## Observation

- Mirrors real-world microservice and full-stack setups
- Ideal for local development, QA, and CI environments
- Same declarative mindset as Kubernetes
- Simplifies onboarding and environment consistency

---

## ✍️ Author

**[Himanshu Kumar](https://www.linkedin.com/in/h1manshu-kumar/)** - Learning by building, documenting, and sharing 🚀

