# Phase 1 --- Baseline Scan (Establish Reality)

## Objective

Establish the current container security posture of the
`02-multi-service-app` using Docker Scout. This phase focuses on
discovery --- understanding vulnerabilities, base images, and dependency
inventory before making any improvements.

No Dockerfiles or runtime configurations are modified in this phase.

------------------------------------------------------------------------

## Branch Strategy

Create a dedicated branch:

    feature/docker-scout-phase1-baseline

All work, reports, and documentation for Phase 1 should be committed
here.

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

------------------------------------------------------------------------

### 2. List images

    docker images

Identify images corresponding to each service.

------------------------------------------------------------------------

### 3. Run quick overview scan

    docker scout quickview <image-name>

This provides:

-   Vulnerability summary
-   Base image details
-   Improvement suggestions

------------------------------------------------------------------------

### 4. Run detailed vulnerability scan

    docker scout cves <image-name>

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

Store scan artifacts in:

    docker-scout/baseline/reports/
    docker-scout/baseline/screenshots/

Recommended screenshots:

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

