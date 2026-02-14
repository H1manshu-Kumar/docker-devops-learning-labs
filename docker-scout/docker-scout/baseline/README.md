# Phase 1 - Baseline Scan

## Objective

Establish the current container security posture of the `multi-service-app` using Docker Scout. This phase focuses on discovery - understanding vulnerabilities, base images, and dependency inventory before making any improvements.

No Dockerfiles or runtime configurations are modified in this phase.

------------------------------------------------------------------------

## Scope

-   Build all services using Docker Compose
-   Identify generated images
-   Run Docker Scout scans
-   Capture outputs as evidence
-   Document observations

------------------------------------------------------------------------

## Steps

### 1. Build services

    docker compose build
<img width="551" height="180" alt="image" src="https://github.com/user-attachments/assets/dc4257b6-c586-4201-91b4-dcda7321b831" />

------------------------------------------------------------------------

### 2. List images

    docker images

<img width="616" height="59" alt="image" src="https://github.com/user-attachments/assets/84d7d32c-7e2c-43c1-ad3f-63f843ff3230" /> </br>


Identify images corresponding to each service.

------------------------------------------------------------------------

### 3. Run quick overview scan

    docker scout quickview <image-name>

<img width="1176" height="187" alt="image" src="https://github.com/user-attachments/assets/39592f61-13a8-4aa3-8253-2f5b3fa9e5d5" /> </br>

<img width="1176" height="217" alt="image" src="https://github.com/user-attachments/assets/1f54d49e-92fe-49b3-8810-3954da868394" /> </br> 

This provides:

-   Vulnerability summary
-   Base image details
-   Improvement suggestions

------------------------------------------------------------------------

### 4. Run detailed vulnerability scan

    docker scout cves <image-name>

<img width="715" height="576" alt="image" src="https://github.com/user-attachments/assets/e79adea4-f5b9-4c16-8173-4f25245863f4" /> </br>

<img width="708" height="523" alt="image" src="https://github.com/user-attachments/assets/f46af03b-a43f-4af2-99b8-eefd9523fb10" /> </br>

Review:

-   Severity distribution
-   Affected packages
-   Fix availability

------------------------------------------------------------------------

### 5. Generate SBOM (recommended)

    docker scout sbom <image-name>

This records the dependency inventory for auditing and analysis.

------------------------------------------------------------------------

## Evidence

find scan artifacts in:

    docker-scout/baseline/reports/
    docker-scout/baseline/screenshots/

Screenshots:

-   Quickview output
-   CVE summary
-   Terminal evidence

------------------------------------------------------------------------

## Observations

Document findings such as:

-   Services with highest vulnerability counts
-   Critical or high severity issues
-   Outdated base images
-   Unexpected dependencies

Example:

-   Service A shows higher CVEs due to older base image.
-   Most vulnerabilities originate from OS packages.

------------------------------------------------------------------------

## Why This Matters

Baseline scanning helps:

-   Understand exposure before changes
-   Prioritize remediation work
-   Track improvements across phases
-   Prepare for CI security enforcement

------------------------------------------------------------------------

