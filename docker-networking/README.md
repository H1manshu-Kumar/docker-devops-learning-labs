# Docker Networking Project 🐳

A hands-on learning project demonstrating Docker networking concepts through a practical Task Manager application with PostgreSQL database.

## 🎯 Project Overview

This project showcases Docker networking fundamentals by building a multi-container application where a Node.js task manager communicates with a PostgreSQL database through a custom Docker network.

## 🏗️ Architecture

```
┌─────────────────┐    ┌──────────────────┐
│   task-app      │    │    task-db       │
│  (Node.js App)  │◄──►│  (PostgreSQL)    │
│   Port: 3000    │    │   Port: 5432     │
└─────────────────┘    └──────────────────┘
         │                       │
         └───────────────────────┘
              task-network
           (172.18.0.0/16)
```

## 🚀 What I Learned

### Docker Networking Concepts
- **Custom Bridge Networks**: Created isolated network for container communication
- **Container Name Resolution**: Containers can communicate using container names as hostnames
- **Network Isolation**: Containers on same network can communicate, others cannot
- **Port Mapping**: Exposing container ports to host system

### Practical Implementation
- Multi-container application deployment
- Database connectivity between containers
- Network troubleshooting and validation
- Container orchestration without Docker Compose

## 📋 Prerequisites

- Docker installed and running
- Basic knowledge of Node.js and PostgreSQL
- Understanding of containerization concepts

## 🛠️ Setup Instructions

### 1. Build Docker Images

**Build Database Image:**
```bash
docker build -t task-db:latest -f Dockerfile.db .
```

**Build Frontend Application Image:**
```bash
docker build -t task-app:latest -f Dockerfile.app .
```

### 2. Create Custom Network
```bash
docker network create task-network
```

### 3. Run PostgreSQL Database
```bash
docker run -d \
  --name task-db \
  --network task-network \
  -e POSTGRES_DB=taskdb \
  -e POSTGRES_USER=taskuser \
  -e POSTGRES_PASSWORD=taskpass \
  task-db:latest
```

### 4. Run Task Manager Application
```bash
docker run -d \
  --name task-app \
  --network task-network \
  -p 3000:3000 \
  -e DB_HOST=task-db \
  -e DB_PORT=5432 \
  -e DB_NAME=taskdb \
  -e DB_USER=taskuser \
  -e DB_PASS=taskpass \
  task-app:latest
```

## ✅ Validation & Testing

### Network Connectivity
```bash
# Check network details
docker network inspect task-network

# Test container connectivity
docker exec task-app ping -c 3 task-db

# Verify database port accessibility
docker exec task-app nc -zv task-db 5432
```

### Application Testing
```bash
# Access web interface
curl http://localhost:3000

# Test API endpoints
curl http://localhost:3000/api/tasks

# Add new task
curl -X POST http://localhost:3000/api/tasks \
  -H "Content-Type: application/json" \
  -d '{"title":"Docker Learning Task"}'
```

## 📊 Network Configuration

| Container | IP Address | Port | Role |
|-----------|------------|------|------|
| task-app | 172.18.0.2 | 3000 | Web Application |
| task-db | 172.18.0.3 | 5432 | PostgreSQL Database |

## 🔍 Key Learning Points

1. **Container Communication**: Containers on the same custom network can communicate using container names
2. **Network Isolation**: Custom networks provide better isolation than default bridge network
3. **Service Discovery**: Docker's built-in DNS resolution enables hostname-based communication
4. **Port Management**: Internal container ports vs external host port mapping

## 🐛 Troubleshooting

### Debug Commands
```bash
# List all networks
docker network ls

# Inspect specific network
docker network inspect task-network

# Check container logs
docker logs task-app
docker logs task-db

# Execute commands inside containers
docker exec -it task-app /bin/sh
docker exec -it task-db psql -U taskuser -d taskdb
```

## 🧹 Cleanup

```bash
# Stop and remove containers
docker stop task-app task-db
docker rm task-app task-db

# Remove custom network
docker network rm task-network
```

## 🤝 Contributing

Feel free to fork this project and experiment with different networking configurations. Pull requests welcome!

## ✍️ Author

**[Himanshu Kumar](https://www.linkedin.com/in/h1manshu-kumar/)** - Learning by building, documenting, and sharing 🚀
