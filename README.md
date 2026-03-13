# Docker Workshop Zoomcamp – Data Pipeline Project
## NYC Taxi Data Pipeline

This project demonstrates a simple data pipeline using:

- Docker
- PostgreSQL
- SQL
- NYC Taxi dataset

The objective is to ingest raw CSV data into a PostgreSQL database running inside Docker and validate the data using SQL queries.

---

## 1. Project Overview

The workflow:

1. Run PostgreSQL inside a Docker container
2. Download NYC Taxi CSV data
3. Execute ingestion script
4. Load data into PostgreSQL
5. Validate data using SQL

This project focuses on local containerized data processing.

---

## 2. Architecture Flow

### Data Pipeline Overview

**Step 1 — Source Data**
- NYC Taxi dataset (CSV format)

**Step 2 — Data Ingestion**
- Python ingestion script reads raw CSV
- Transforms data if required
- Sends data to PostgreSQL

**Step 3 — Data Storage**
- PostgreSQL running inside Docker container
- Structured tables for trip records

### Flow Summary

NYC Taxi CSV → Ingestion Script → PostgreSQL (Docker Container)


---

## 3. Docker Setup

### Purpose
Provide a reproducible environment for running PostgreSQL.

### Components
- PostgreSQL container
- Docker Compose for orchestration
- Volume mapping for persistent storage
- Port mapping for database access

### Run Docker Services

```bash
docker-compose up
```
---
## 4. PostgreSQL Database

### Responsibilities
- Store structured taxi trip records
- Define table schema
- Support SQL-based validation

### Example Data Fields
- Pickup datetime
- Dropoff datetime
- Passenger count
- Trip distance
- Fare amount
- Location IDs

---
## 5. Data Ingestion Process

### Steps

1. Download NYC Taxi dataset (CSV)
2. Start PostgreSQL using Docker
3. Run ingestion script:

```bash
python ingest_data.py
```
---
## 6. Connect to PostgreSQL
Access the running container:
```bash
docker exec -it <container_name> psql -U <user> -d <database>
```
Run SQL queries to confirm data is loaded correctly.
---
## 7. Project Structure
### Root Directory: `pipeline/`

- `docker-compose.yaml`  
  Defines PostgreSQL container configuration and service setup.

- `ingest_data.py`  
  Python script responsible for loading CSV data into PostgreSQL.
---
## 8. Summary
This repository demonstrates:
- Running PostgreSQL inside Docker
- Ingesting structured CSV data
- Managing database schema
- Validating data using SQL
- Building a reproducible local data pipeline
---
Thank You
