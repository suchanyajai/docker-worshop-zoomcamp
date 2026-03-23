# Docker Workshop Zoomcamp – Data Pipeline Project
## NYC Taxi Data Pipeline

This project demonstrates a simple data pipeline using:

- Docker
- PostgreSQL
- SQL
- NYC Taxi dataset

The objective is to ingest raw CSV data into a PostgreSQL database running inside Docker and validate the data using SQL queries.

---

## 1. Project Structure (Full)
```bash
.
├── pipeline/
│   ├── docker-compose.yaml        # Define PostgreSQL service
│   └── ingest_data.py             # Ingest CSV data into PostgreSQL
│
├── keys/
│   ├── main.tf                    # Terraform resources (GCS, BigQuery)
│   ├── variables.tf               # Input variables (project, region, names)
│   └── terraform.tfstate*         # Terraform state files (ignored in Git)
│
├── .gitignore                     # Exclude env, state, cache files
└── README.md                      # Project documentation
```
### Explanation
```bash
pipeline/
```
- Local data pipeline (Docker + PostgreSQL)
- Handles ingestion and SQL validation

```bash
keys/
```
- Terraform configuration for GCP
- Manages infrastructure (GCS + BigQuery)
---

## 2. Architecture Flow

### Data Pipeline Overview

**Step 1 — Source Data**
- NYC Taxi dataset (CSV format)

**Step 2 — Data Ingestion**
- Python ingestion script reads raw CSV
- Transforms data if required
- Sends data to PostgreSQL


**Step 3 — Data Storage(Local)**
- PostgreSQL running inside Docker container
- Structured tables for trip records

**Step 4 — Cloud Infrastructure**
- Terraform provisions GCP resources
- GCS Bucket for storage
- BigQuery Dataset for analytics

### Flow Summary

```bash
NYC Taxi Data
      ↓
Python Ingestion Script
      ↓
PostgreSQL (Docker)
      ↓
GCP Infrastructure (Terraform)
      ↓
GCS / BigQuery
```

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
## 7. Directory
### Root Directory: `pipeline/`

- `docker-compose.yaml`  
  Defines PostgreSQL container configuration and service setup.

- `ingest_data.py`  
  Python script responsible for loading CSV data into PostgreSQL.

---
## 8. Cloud Infrastructure with Terraform (GCP)
### Objective
- Provision infrastructure using Terraform
- Use secure authentication (no JSON key)
- Extend pipeline from local → cloud
### Resources Created
- GCS Bucket (data storage)
- BigQuery Dataset (analytics layer)
### Terraform Commands
```bash
terraform init
terraform plan
terraform apply
```
### Cleanup 
```bash
terraform destroy
```
### Authentication
- Uses Application Default Credentials (ADC)
```bash
gcloud auth application-default login
```
- Uses Service Account Impersonation
- No credential file stored in repo
---
## 9. Pipeline Integration
### Local Layer
- Docker + PostgreSQL
- CSV ingestion
- SQL validation
### Cloud Layer
- Terraform (GCP resources)
- GCS + BigQuery
### Flow 
```bash
CSV → Python → PostgreSQL (Docker) → GCP (GCS / BigQuery)
```
---
## 10. Summary
- Running PostgreSQL inside Docker (containerized environment)
- Ingesting NYC Taxi data (CSV/Parquet) using Python
- Performing data validation with SQL queries
- Designing a reproducible local data pipeline
- Provisioning cloud infrastructure using Terraform (GCP)
- Creating GCS Bucket and BigQuery Dataset
- Applying secure authentication via Service Account Impersonation
- Demonstrating end-to-end workflow: local processing → cloud setup
---
## 11. Key Learnings
- Docker + database setup
- SQL data validation
- Terraform workflow
- GCP IAM & authentication
- Infrastructure as Code
---
## 12. Notes
- Resources are temporary → run terraform destroy after use
- .gitignore is used to exclude:
```bash
.venv/
.terraform/
*.tfstate
```
---
Thank you 