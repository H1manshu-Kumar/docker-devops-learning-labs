<div align="center">

<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/docker/docker-original-wordmark.svg" alt="Docker" width="100" height="100"/>

# Docker DevOps Lab

### Production-Grade Container Engineering · DevSecOps · Real-World Patterns

[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![DevSecOps](https://img.shields.io/badge/DevSecOps-Security--First-critical?style=for-the-badge&logo=shield&logoColor=white)](https://github.com/H1manshu-Kumar/docker)
[![Docker Scout](https://img.shields.io/badge/Docker%20Scout-CVE%20Scanning-blue?style=for-the-badge&logo=docker&logoColor=white)](https://docs.docker.com/scout/)
[![Docker Compose](https://img.shields.io/badge/Docker%20Compose-Multi--Service-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://docs.docker.com/compose/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge)](https://github.com/H1manshu-Kumar/docker/pulls)

<br/>

> **"Build systems that are secure, observable, reproducible, and resilient."**

*A hands-on containerization portfolio built by a QA Engineer applying a test-everything mindset to production Docker patterns.*

[🚀 Quick Start](#-quick-start) · [📂 Lab Modules](#-lab-modules) · [🛡 DevSecOps](#-devsecops--docker-scout) · [🧠 Lessons Learned](#-lessons-learned) · [🗺 Roadmap](#-roadmap)

</div>

---

## 📌 What This Repository Is

This is **not a tutorial follow-along**. This is a structured engineering lab where each module solves a real production problem - documented from a QA Engineer's perspective of *testing systems, not just building them*.

| What you'll find here | Why it matters |
|---|---|
| Multi-stage Dockerfiles with size benchmarks | Proves understanding of CI build optimization |
| Distroless & non-root container patterns | Reflects security-first production thinking |
| Docker Scout CVE scanning workflows | Shows DevSecOps integration, not just awareness |
| Docker Compose multi-service orchestration | Real-world service dependency management |
| Container networking & volume labs | Stateful workloads & service isolation patterns |
| Troubleshooting documentation | Operational maturity - not just happy path |

---

## ⚡ Quick Start

Pick any module and run it in under 2 minutes:

```bash
# Clone the repo
git clone https://github.com/H1manshu-Kumar/docker.git
cd docker

# Run the multi-service Compose stack
cd docker-compose
docker compose up -d

# Scan an image for vulnerabilities with Docker Scout
cd docker-scout
docker scout cves <image-name>

# Bring up the Node.js app container
cd nodejs-app
docker build -t nodejs-demo .
docker run -p 3000:3000 nodejs-demo
```

> 💡 Each module has its own `README.md` with step-by-step instructions, expected output, and what to observe.

---

## 📂 Lab Modules

```
docker/
├── java-app/                  ← Multi-stage build · JRE-only runtime image
├── nodejs-app/                ← Distroless Node.js · non-root user pattern
├── python-app/                ← Slim Python image · .dockerignore best practices
├── nginx-app/                 ← Static serving · reverse proxy patterns
├── docker-compose/            ← Multi-service orchestration · dependency management
├── docker-networking/         ← Bridge networks · service discovery · isolation
├── docker-volumes-handson/    ← Named volumes · bind mounts · stateful workloads
└── docker-scout/              ← CVE scanning · base image analysis · remediation
```

### Module Breakdown

#### ☕ Application Containerization (`java-app`, `nodejs-app`, `python-app`, `nginx-app`)
Containerizing polyglot workloads - Java, Node.js, Python, and Nginx - with production Dockerfile patterns applied to each.

**Key techniques applied:**
- Multi-stage builds to separate build and runtime environments
- Distroless base images to minimize attack surface
- Non-root `USER` instructions in every Dockerfile
- Explicit version pinning - no `latest` tags
- `.dockerignore` to prevent leaking build artifacts into images

**Image size impact (multi-stage vs naive build):**

| App | Naive Image Size | Optimized Size | Reduction |
|---|---|---|---|
| Java App | ~600 MB | ~95 MB | **~84%** |
| Node.js App | ~1.1 GB | ~130 MB | **~88%** |
| Python App | ~900 MB | ~110 MB | **~88%** |

> These numbers reflect why CI/CD pipelines care about image size - smaller images mean faster pull times, reduced registry costs, and lower attack surface.

---

#### ⚙️ Docker Compose (`docker-compose/`)
Multi-container orchestration patterns for realistic application stacks.

**What's covered:**
- Service dependency management with `depends_on` and health checks
- Environment variable injection without baking secrets into images
- Named volume definitions for data persistence
- Custom network definitions for service isolation
- Override files for dev vs prod configuration

---

#### 🌐 Docker Networking (`docker-networking/`)
Container networking is one of the most common sources of production incidents. This module covers it systematically.

**What's covered:**
- Bridge vs host vs none network modes
- Custom bridge networks for service discovery by name
- Network isolation between services
- Port conflict diagnosis and resolution
- Inter-container communication debugging

---

#### 💾 Volumes & Persistence (`docker-volumes-handson/`)
Containers are ephemeral - data management is not optional.

**What's covered:**
- Named volumes vs bind mounts - when to use each
- Volume lifecycle management (`create`, `inspect`, `prune`)
- Persistent database patterns
- Data container patterns for backup workflows

---

#### 🛡 Docker Scout - CVE Scanning (`docker-scout/`)
Security shifted left into the build pipeline.

**What's covered:**
- `docker scout cves` - vulnerability scanning by severity
- `docker scout recommendations` - base image upgrade analysis
- Supply chain awareness - understanding what's inside your image
- Remediation workflow - scan → identify → upgrade → verify

See the [DevSecOps section](#-devsecops--docker-scout) for the full security narrative.

---

## 🛡 DevSecOps & Docker Scout

Security is not a phase - it's a pipeline stage.

```
Developer pushes code
        │
        ▼
  docker build image
        │
        ▼
  docker scout cves ◄─── Fail build on CRITICAL CVEs
        │
        ▼
  docker scout recommendations
        │
        ▼
  Upgrade base image / deps
        │
        ▼
  Verified clean image → deploy
```

**Practical outcomes from Scout labs:**

| Finding Type | Example | Resolution Applied |
|---|---|---|
| OS-level CVE | Outdated `libssl` in ubuntu:20.04 | Switched to `ubuntu:22.04` |
| Dependency CVE | Vulnerable npm package version | Pinned to patched version |
| High-risk base image | `node:latest` (1100+ vulnerabilities) | Switched to `node:20-alpine` |
| Secrets in layer | ENV with password baked in | Moved to runtime env injection |

> **Key takeaway:** Scanning revealed that `node:latest` carried 1100+ vulnerabilities. `node:20-alpine` reduced this to under 20. This is a production decision, not a preference.

---

## 🐳 Dockerfile Engineering Standards

Every Dockerfile in this repository follows these non-negotiable standards:

```dockerfile
# ✅ GOOD — what every Dockerfile here does

# 1. Explicit base image version - no :latest
FROM eclipse-temurin:17-jre-alpine

# 2. Metadata
LABEL maintainer="Himanshu Kumar" version="1.0"

# 3. Non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# 4. Minimal layer count - grouped RUN commands
RUN apk add --no-cache curl && rm -rf /var/cache/apk/*

# 5. WORKDIR always set
WORKDIR /app

# 6. Copy only what's needed (backed by .dockerignore)
COPY --chown=appuser:appgroup target/*.jar app.jar

# 7. Switch to non-root before CMD
USER appuser

# 8. Health check
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

CMD ["java", "-jar", "app.jar"]
```

---

## 🧠 Lessons Learned

These are real observations from building and breaking containers - not paraphrased documentation.

### Container Fundamentals
- The mental model shift: **a container is a process, not a VM**. Understanding this changes how you debug, size, and secure them.
- Namespace isolation is what makes containers feel like VMs but behave like processes - and why `--privileged` is dangerous.
- Image layering is a caching mechanism first, a storage format second. Ordering your `COPY` and `RUN` instructions wrong costs you minutes per CI build.

### Dockerfile Engineering
- **Multi-stage builds** are not optional for production. A Java app that ships the full JDK in production is shipping a compiler to users - that's a security and size failure.
- **Distroless images** remove the shell entirely. You gain attack surface reduction but lose the ability to `exec` in for debugging - which forces better observability design upfront.
- `.dockerignore` is as important as `.gitignore`. Copying `node_modules/` or `.git/` into an image is not just slow - it's a potential data leak.

### Networking Realizations
- Service-to-service calls that work locally often fail in containers because `localhost` inside a container refers to *that container*, not the host.
- **Custom bridge networks are the correct default** for Compose services - they enable DNS-based service discovery by container name.
- Port conflicts in development (`bind: address already in use`) are almost always a leftover container, not a host conflict.

### Persistence Strategy
- Named volumes survive `docker-compose down` - bind mounts don't always behave predictably across environments. **Named volumes are the production pattern.**
- Volume pruning (`docker volume prune`) has silently deleted data in dev environments. Understanding lifecycle before running prune in shared environments matters.

### Security Mindset
- `docker history <image>` reveals every layer - including ones where secrets were `ENV`-set and then "deleted". Deletion doesn't remove it from history.
- Running as root in a container doesn't give you host root (in most configurations) - but it gives an attacker a much better starting position if they escape.
- Scout scanning is only useful if the build fails on findings. A scan that doesn't gate deployment is just noise.

### Debugging Approach
```
Problem reported
      │
      ▼
docker logs <container>        ← 80% of issues visible here
      │
      ▼
docker inspect <container>     ← network, mounts, env, state
      │
      ▼
docker exec -it <container> sh ← only if distroless allows it
      │
      ▼
docker stats                   ← resource contention check
      │
      ▼
Reproduce in isolation         ← always reduce to minimal case
```

---

## 🏗 Production Patterns Applied

| Pattern | Applied In | Why It Matters |
|---|---|---|
| Multi-stage build | `java-app`, `nodejs-app` | Separates build tools from runtime - smaller, safer images |
| Distroless runtime | `nodejs-app`, `python-app` | No shell = reduced attack surface |
| Non-root USER | All Dockerfiles | Container breakout requires root - deny it by default |
| `.dockerignore` | All app modules | Prevents accidental context bloat and secret leaks |
| Explicit version pins | All Dockerfiles | Reproducible builds - no surprise regressions from upstream changes |
| `HEALTHCHECK` instruction | Compose services | Enables Docker and orchestrators to detect unhealthy containers |
| Named volumes | `docker-volumes-handson` | Data persists across container restarts - required for stateful workloads |
| Custom bridge network | `docker-compose` | Predictable service discovery - no manual IP management |
| Scout CVE gating | `docker-scout` | Security is a pipeline stage, not a post-deployment review |

---

## 🔍 QA-to-DevOps Perspective

My background in test automation shapes how I approach containers differently:

**Shift-left security** — I treat Docker Scout CVE scanning the way I treat automated test gates: if it fails, the build doesn't ship. Security findings are defects, not suggestions.

**Failure mode documentation** — Every module includes what I deliberately broke and how I debugged it. Understanding failure modes is more valuable than knowing the happy path.

**Reproducibility as a test property** — A container that behaves differently between `docker run` locally and a CI pipeline is a flaky test. I treat environment consistency as a quality requirement.

**Observability as a feature** — Health checks and structured logs aren't optional. You can't test what you can't observe. A container with no health check is an untestable service.

---

## 🗺 Roadmap

- [x] Docker fundamentals & image engineering
- [x] Multi-stage & distroless build patterns
- [x] Docker Compose multi-service orchestration
- [x] Container networking & volumes
- [x] Docker Scout CVE scanning & remediation
- [ ] GitHub Actions CI pipeline — build, scan, push on every PR
- [ ] Kubernetes deployments — Deployments, Services, ConfigMaps
- [ ] Monitoring stack — Prometheus + Grafana in Compose
- [ ] Secrets management — Docker secrets vs environment injection
- [ ] Testcontainers — automated integration tests against real containers
- [ ] Platform engineering patterns — internal developer platform concepts

---

## 📁 Each Module Contains

```
module-name/
├── README.md          ← Lab objective, commands, expected output, lessons
├── Dockerfile         ← Production-standard, commented
├── .dockerignore      ← Context optimization
├── docker-compose.yml ← (where applicable)
└── app/               ← Sample application code
```

---

## 🤝 Contributing

Found a better pattern? Spotted a mistake? PRs are welcome.

1. Fork the repo
2. Create your branch: `git checkout -b feat/improve-multistage-java`
3. Commit with context: `git commit -m "feat: reduce java image size using jlink custom JRE"`
4. Push and open a PR with what you changed and why

---

## 👨‍💻 Author

**Himanshu Kumar**  
QA Automation Engineer → DevOps Engineer  
*Building, containerizing, and deploying — one lab at a time.*

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/h1manshu-kumar)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/H1manshu-Kumar)

---

<div align="center">

**If this repository helped you understand production container patterns, consider starring ⭐ — it helps others find it.**

*Learning in public. Shipping real patterns.*

</div>
