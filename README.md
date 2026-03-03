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

Terraform is used to define infrastructure resources separately.

---

## 3. Docker Setup

### Purpose
Create isolated and reproducible environments.

### Components
- PostgreSQL container
- Ingestion script container (if applicable)
- Docker Compose for service orchestration

### Key Concepts
- Images and containers
- Port mapping
- Volume mounting for data persistence
- Environment variables

---

## 4. PostgreSQL & SQL

### Database Responsibilities
- Store structured taxi trip data
- Define table schemas
- Support analytical queries

### Data Includes
- Pickup & dropoff timestamps
- Passenger count
- Trip distance
- Fare amount
- Location IDs

### SQL Usage
- Table creation
- Data insertion
- Data validation queries

---

## 5. Data Ingestion Pipeline

### Step-by-step Process

1. Download NYC Taxi dataset (CSV format)
2. Start services using Docker Compose
3. Run ingestion script
4. Load data into PostgreSQL
5. Query the database to validate results

---

## 6. Terraform

### Purpose
Define infrastructure using code.

### Concepts Used
- Providers
- Resources
- Variables
- State management

### Basic Commands

```bash
terraform init
terraform plan
terraform apply
