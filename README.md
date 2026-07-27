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

---

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

This project uses the **M5 Retail Sales Forecasting Dataset**.

The dataset contains:

- Daily sales history
- Product information
- Store information
- Calendar events
- Weekly pricing data

Main source tables:

```
sales
prices
calendar
```

---

# Project Structure

```text
cloud-retail-analytics-platform/

│
├── data/
│   └── raw/
│
├── dbt/
│   └── cloud_retail_dbt/
│
│       ├── models/
│       │
│       ├── staging/
│       │   ├── stg_sales.sql
│       │   ├── stg_prices.sql
│       │   ├── stg_calendar.sql
│       │   └── schema.yml
│       │
│       └── marts/
│           ├── fact_sales.sql
│           ├── fact_sales_long.sql
│           └── daily_sales_metrics.sql
│
│       ├── snapshots/
│       │   └── prices_snapshot.sql
│       │
│       ├── macros/
│       │
│       └── dbt_project.yml
│
└── README.md
```

---

# Data Pipeline

## 1. Data Lake Layer

Raw retail files are stored in Amazon S3.

Example:

```
s3://retail-data-lake/raw/
```

The raw layer keeps the original source data before transformations.

---

## 2. Data Catalog & Query Layer

AWS Glue is used for:

- Schema discovery
- Data cataloging
- ETL workflow concepts

Amazon Athena enables SQL querying directly on S3 data.

---

# Snowflake Data Warehouse

Snowflake is used as the analytical warehouse.

Database:

```
RETAIL_ANALYTICS
```

Schemas:

```
RAW
|
STAGING
|
SNAPSHOTS
```

---

# dbt Transformations

The transformation layer is implemented using dbt.

dbt is responsible for:

- SQL-based transformations
- Data modeling
- Testing
- Documentation-ready analytics models

---

# Staging Layer

The staging layer cleans and standardizes raw datasets.

---

## stg_sales

Transforms raw sales data.

Main columns:

```
ID
ITEM_ID
DEPT_ID
STORE_ID
STATE_ID
D_1 ... D_1913
```

---

## stg_prices

Transforms weekly product pricing information.

Columns:

```
STORE_ID
ITEM_ID
WM_YR_WK
SELL_PRICE
```

---

## stg_calendar

Creates a calendar dimension.

Columns:

```
DATE
WM_YR_WK
EVENT_NAME
EVENT_TYPE
SNAP_CA
SNAP_TX
SNAP_WI
```

---

# Data Modeling

## Fact Sales Table

Created an analytical fact table by transforming sales data and enriching it with reference information.

The fact table provides a structured layer for downstream analytics.

---

## Fact Sales Long Table

The original M5 sales dataset is provided in a wide format:

```
D_1
D_2
D_3
...
```

This project converts the sales data into a normalized long format using Snowflake UNPIVOT functionality.

Output structure:

```
ID
ITEM_ID
STORE_ID
D
SALES
```

Benefits:

- Easier analytics
- Better time-series analysis
- Improved downstream querying

---

# Snapshots

dbt snapshots are used to track historical changes.

Example:

```
prices_snapshot
```

Tracks changes in:

```
SELL_PRICE
```

over time.

---

# Data Quality Testing

Implemented dbt data quality checks:

- not_null validation
- unique validation

Example:

```bash
dbt test
```

Result:

```
15 tests passed
```

---

# Running the Project

Install dbt dependencies:

```bash
dbt deps
```

Run transformations:

```bash
dbt run
```

Run data quality tests:

```bash
dbt test
```

Run snapshots:

```bash
dbt snapshot
```

---

# Key Outcomes

This project demonstrates:

- Building a cloud-based analytics architecture
- Working with AWS data lake components
- Designing Snowflake warehouse layers
- Developing dbt transformation pipelines
- Applying analytics engineering best practices
- Implementing data quality validation
- Creating analytical data marts for reporting and analysis

---

# Future Improvements

Potential future enhancements:

- Add Airflow orchestration
- Add CI/CD pipeline with GitHub Actions
- Connect Snowflake models to BI tools
- Deploy dbt workflows in a cloud environment
