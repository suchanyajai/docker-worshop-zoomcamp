# Data Pipeline – Docker Workshop Zoomcamp

This project demonstrates a simple end-to-end data pipeline using:

- Docker containers
- PostgreSQL
- SQL
- Terraform
- NYC Taxi dataset

The focus is on building a reproducible local data pipeline and managing infrastructure using Infrastructure as Code.

---

## 1. Project Overview

The workflow consists of:

1. Running PostgreSQL inside Docker
2. Ingesting NYC Taxi CSV data into the database
3. Managing infrastructure configuration using Terraform
4. Querying and validating data using SQL

The project separates:
- Application layer (data ingestion)
- Database layer (Postgres)
- Infrastructure layer (Terraform)

---

## 2. Architecture Flow
