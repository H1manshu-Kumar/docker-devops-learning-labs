# Docker Networking - Concepts & Hands-On Notes

## 1. What is Docker Networking?
Docker networking enables communication between containers, containers and the host, and containers across multiple hosts.

Without networking:
- Containers remain isolated
- Services cannot communicate
- Real-world application architectures are not possible

Docker abstracts low-level networking and provides built-in DNS, isolation, and routing.

---

## 2. Why Docker Networking Is Important
Modern applications are composed of multiple services:
- Frontend → Backend
- Backend → Database

Docker networking enables:
- Service discovery
- Secure internal communication
- Environment consistency (local, CI, production)

---

## 3. Docker Network Drivers

| Driver  | Use Case | Notes |
|-------|--------|------|
| bridge | Single-host container communication | Most commonly used |
| host | Container shares host network | No isolation |
| none | No networking | Debugging only |
| overlay | Multi-host communication | Docker Swarm / Kubernetes |

**Primary focus:** `bridge` network

---

## 4. Default Bridge vs User-Defined Bridge

### Default Bridge (Not Recommended)
- No automatic DNS resolution
- Containers communicate via IP
- Poor isolation

### User-Defined Bridge (Recommended)
- Built-in DNS resolution
- Containers communicate using container names
- Better isolation and security

```bash
docker network create task-network
```
---
## 5. Container DNS & Service Discovery
Docker provides an internal DNS server for user-defined networks.

### Key Points
- Container name acts as hostname
- No hardcoded IPs required
- Container restarts do not break communication

Example:
```bash
postgresql://task-db:5432
```
**Important:** `localhost` does not work between containers.


## 6. Port Mapping vs Internal Networking
### Internal Communication
- Happens inside Docker network
- No port exposure required

**Host** **↔** **Container Access**
- Requires port mapping
```bash
-p 3000:3000
```
### Best Practice
| Service | Expose to Host | Reason |
|------|---------------|------|
| Frontend | Yes | User access |
| Database | No | Security |

---
## 7. Hands-On Architecture: Task Manager App

### Components
- Frontend: Node.js task manager
- Database: POSTGRESQL
- Network: User-defined bridge network

### Communication Flow
```
Browser → Frontend Container → Database Container
```

- Containers attached to same network
- Frontend connects using DB container name
- Database port not exposed to host

---

## 8. Docker Commands Used

### Create Network
```bash
docker network create task-network
```

### Run Database Container
```bash
docker run -d --name task-db --network task-network -e POSTGRES_DB=taskdb -e POSTGRES_USER=taskuser -e POSTGRES_PASSWORD=taskpass task-db:latest
```

### Run Frontend Container
```bash
docker run -d --name task-app --network task-network -p 3000:3000 -e DB_HOST=task-db -e DB_PORT=5432 -e DB_NAME=taskdb -e DB_USER=taskuser -e DB_PASS=taskpass task-app:latest
```
---

## 9. Debugging Docker Networks

### Inspect Network
```bash
docker network inspect task-network
```

### Access Container Shell
```bash
docker exec -it task-app sh
```

### Test Connectivity
```bash
ping task-db
```

---

## 10. Common Mistakes

❌ Using `localhost` for container-to-container communication  
❌ Hardcoding container IP addresses  
❌ Exposing database ports unnecessarily  
❌ Using default bridge for production-like setups  

✅ Use container names  
✅ Use user-defined bridge networks  
✅ Keep databases internal  
✅ Inspect networks when debugging  

---

## 11. Security Best Practices
- Use isolated networks per application
- Expose only required services
- Avoid `--network host`
- Never expose database ports publicly

---

## 12. Docker Networking vs Kubernetes (Concept Mapping)

| Docker | Kubernetes |
|------|-----------|
| Docker network | Kubernetes Service |
| Container name | Service name |
| Bridge network | Pod network |
| Port mapping | NodePort / Ingress |

Docker networking knowledge directly helps in Kubernetes.

---

## 13. Observations
- Containers communicate using Docker DNS via service names
- User-defined bridge networks provide isolation and DNS
- Databases should remain internal to Docker networks
- Docker networking removes dependency on static IPs

---
## ✍️ Author

**[Himanshu Kumar](https://www.linkedin.com/in/h1manshu-kumar/)** – Learning by building, documenting, and sharing 🚀
