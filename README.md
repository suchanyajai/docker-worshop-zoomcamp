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

<img width="1062" height="334" alt="image" src="https://github.com/user-attachments/assets/2cb57a5b-b356-453b-bdc0-3425c65dc1db" />

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
# How to Run
## 1. Requirements
- Docker & Docker Compose
- Python 3.9+
- Google Cloud SDK (gcloud)
- Terraform
---
## 2. Setup Environment
```bash
git clone <your-repo-url>
cd <repo-name>
```
--
## 3. Start PostgreSQL (Docker)
### Start PostgreSQL
```bash
cd pipeline
docker-compose up -d
```
---
## 4. Ingest Data
```bash
uv run python ingest_data.py \
  --pg-user=root \
  --pg-pass=root \
  --pg-host=localhost \
  --pg-port=5432 \
  --pg-db=ny_taxi \
  --target-table=yellow_taxi_trips
```
---
## 5. Validate Data
```bash
docker exec -it <container_name> psql -U postgres -d ny_taxi
```
Example queries:
```bash
SELECT COUNT(*) FROM trips;
SELECT
    CAST(tpep_dropoff_datetime AS DATE) AS "day",
    COUNT(1) AS "count"
FROM
    yellow_taxi_trips
GROUP BY
    CAST(tpep_dropoff_datetime AS DATE)
ORDER BY
    "count" DESC
LIMIT 100;
```
---
## 6. Setup GCP Authentication
```bash
gcloud auth application-default login
```
---
## 7. Run Terraform
```bash
cd keys
terraform init
terraform plan
terraform apply
```
---
## 8. Load to BigQuery
```bash
bq load \
  --source_format=CSV \
  dataset.table \
  data.csv
```
---
## 9. Shutdown / Cleanup
```bash
docker-compose down
```
Destroy cloud resources:
```bash
terraform destroy
```
---
Thank You
