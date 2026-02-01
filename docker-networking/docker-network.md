# Docker Networking – Concepts & Hands-On Notes

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
docker network create taskmanager-network

