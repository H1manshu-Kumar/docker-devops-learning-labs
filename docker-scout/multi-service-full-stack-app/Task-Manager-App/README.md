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
</br>

<img width="978" height="62" alt="image" src="https://github.com/user-attachments/assets/8397970b-b21b-4c7e-818a-d1921e5cbf6a" />

### 2. Create Custom Network
```bash
docker network create task-network
```
<img width="481" height="117" alt="image" src="https://github.com/user-attachments/assets/14993ac9-f4c0-4b85-9d9a-36b8fbbe7d73" />

### 3. Run PostgreSQL Database
```bash
docker run -d --name task-db --network task-network -e POSTGRES_DB=taskdb -e POSTGRES_USER=taskuser -e POSTGRES_PASSWORD=taskpass task-db:latest
```
<img width="837" height="82" alt="image" src="https://github.com/user-attachments/assets/0c78a80f-22d3-4dfa-bd28-651135555b93" />

### 4. Run Task Manager Application
```bash
docker run -d --name task-app --network task-network -p 3000:3000 -e DB_HOST=task-db -e DB_PORT=5432 -e DB_NAME=taskdb -e DB_USER=taskuser -e DB_PASS=taskpass task-app:latest
```
<img width="837" height="82" alt="image" src="https://github.com/user-attachments/assets/93bee68a-a223-4ae4-b04f-a5f6311e6e64" />

## ✅ Validation & Testing

### Network Connectivity

- Check network details
```bash
docker network inspect task-network
```
<img width="700" height="519" alt="image" src="https://github.com/user-attachments/assets/e7e3a5a5-ad59-4a54-8621-4aa274909051" /> </br>

- Test container connectivity
```bash
docker exec task-app ping -c 3 task-db
```
<img width="585" height="174" alt="image" src="https://github.com/user-attachments/assets/415e5cb5-6ac7-45a4-97a0-42ac20d215cc" /> </br>


- Verify database port accessibility
```bash
docker exec task-app nc -zv task-db 5432
```
<img width="435" height="40" alt="image" src="https://github.com/user-attachments/assets/5aeeccbf-212f-4030-a0bb-99ef3518803d" /> </br>

### Application Testing

- Access web interface
```bash
curl http://localhost:3000
```
<img width="870" height="458" alt="image" src="https://github.com/user-attachments/assets/38c57d4c-53ee-4be5-b141-ca25e8844c17" /> </br>

- Test API endpoints
```bash
curl http://localhost:3000/api/tasks
```
```bash
[  
  {
    "id": 1,
    "title": "TASK 1",
    "created_at": "2026-02-01T09:30:25.659Z"
  },
  {
    "id": 2,
    "title": "TASK 2",
    "created_at": "2026-02-01T09:30:30.285Z"
  },
  {
    "id": 3,
    "title": "TASK 3",
    "created_at": "2026-02-01T09:30:34.157Z"
  },
  {
    "id": 4,
    "title": "TASK 4",
    "created_at": "2026-02-01T09:30:38.176Z"
  },
  {
    "id": 5,
    "title": "TASK 5",
    "created_at": "2026-02-01T09:30:41.923Z"
  },
  {
    "id": 6,
    "title": "TASK 6",
    "created_at": "2026-02-01T09:37:31.871Z"
  }
]
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
