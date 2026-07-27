# Cloud Retail Analytics Platform

An end-to-end cloud analytics engineering project built on AWS, Snowflake, and dbt using the M5 Retail Sales Dataset.

The goal of this project is to demonstrate a modern cloud data platform architecture, including data lake ingestion, cloud data warehousing, ELT transformations, data modeling, and data quality validation.

---

# Architecture
```text
Retail Dataset
                 |
                 v
          Amazon S3
        (Raw Data Lake)
                 |
                 v
          AWS Glue
   (Data Catalog / ETL Concepts)
                 |
                 v
          Amazon Athena
    (SQL Query on S3 Data)
                 |
                 v
          Snowflake
    (Cloud Data Warehouse)
                 |
                 v
             dbt
    (Transformations & Modeling)
                 |
                 v
        Analytics Data Marts
```


# Tech Stack

## Cloud Platform

- Amazon S3
- AWS Glue
- Amazon Athena

## Data Warehouse

- Snowflake

## Transformation

- dbt Core
- SQL
- dbt-utils

## Data Quality

- dbt tests
- not_null tests
- unique tests

## Development

- Python
- Git
- VS Code

---

# Dataset

This project uses the M5 Retail Sales Forecasting Dataset.

The dataset contains:

- Daily sales history
- Product information
- Store information
- Calendar events
- Weekly pricing data


Main source tables:

sales
prices
calendar

---

# Project Structure

cloud-retail-analytics-platform/

│
├── data/
│ └── raw/
│
├── dbt/
│ └── cloud_retail_dbt/
│
│ ├── models/
│ │
│ ├── staging/
│ │ ├── stg_sales.sql
│ │ ├── stg_prices.sql
│ │ ├── stg_calendar.sql
│ │ └── schema.yml
│ │
│ ├── marts/
│ │ ├── fact_sales.sql
│ │ ├── fact_sales_long.sql
│ │ └── daily_sales_metrics.sql
│ │
│ ├── snapshots/
│ │ └── prices_snapshot.sql
│ │
│ ├── macros/
│ │
│ └── dbt_project.yml
│
└── README.md

