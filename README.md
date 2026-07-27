# Cloud Retail Analytics Platform

An end-to-end cloud analytics engineering project built on AWS, Snowflake, and dbt using the M5 Retail Sales Dataset.

The goal of this project is to demonstrate a modern cloud data platform architecture, including cloud data ingestion, data lake concepts, cloud data warehousing, ELT transformations, data modeling, and data quality validation.

---

# Architecture

```text
Retail Dataset
                 |
                 v
          Python Ingestion
             (boto3)
                 |
                 v
          Amazon S3
        (Raw Data Lake)
                 |
                 v
          AWS Glue
   (Data Catalog / Metadata Layer)
                 |
                 v
          Amazon Athena
    (SQL Query Engine on S3)
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
- boto3
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

Main source files:

```text
sales_train_validation.csv
sell_prices.csv
calendar.csv
```

---

# Project Structure

```text
cloud-retail-analytics-platform/

│
├── src/
│   └── ingestion/
│       └── upload_to_s3.py
│
├── dbt/
│   └── cloud_retail_dbt/
│
│       ├── models/
│       │
│       │   ├── staging/
│       │   │   ├── stg_sales.sql
│       │   │   ├── stg_prices.sql
│       │   │   ├── stg_calendar.sql
│       │   │   └── schema.yml
│       │   │
│       │   └── marts/
│       │       ├── fact_sales.sql
│       │       ├── fact_sales_long.sql
│       │       └── daily_sales_metrics.sql
│       │
│       ├── snapshots/
│       │   └── prices_snapshot.sql
│       │
│       ├── macros/
│       │
│       └── dbt_project.yml
│
├── requirements.txt
├── .env.example
└── README.md
```

---

# Data Pipeline

## 1. Cloud Data Ingestion

Raw retail CSV files are uploaded into Amazon S3 using Python and boto3.

The ingestion workflow:

```text
Local CSV Files

        |

Python boto3 uploader

        |

Amazon S3 Raw Data Lake
```

The ingestion script:

```text
src/ingestion/upload_to_s3.py
```

uploads:

```text
calendar.csv
sales_train_validation.csv
sell_prices.csv
```

into the S3 raw layer.

---

# AWS S3 Data Lake

Amazon S3 is used as the raw storage layer.

Responsibilities:

- Store raw retail datasets
- Maintain original source files
- Provide scalable cloud storage

Example structure:

```text
s3://retail-data-lake/raw/

calendar.csv
sales_train_validation.csv
sell_prices.csv
```

---

# AWS Glue

AWS Glue is used for metadata management and data catalog concepts.

Responsibilities:

- Schema discovery
- Metadata management
- Data cataloging
- Supporting ETL workflows

Workflow:

```text
Amazon S3

    |

AWS Glue Crawler

    |

Glue Data Catalog
```

---

# Amazon Athena

Amazon Athena enables SQL querying directly on data stored in Amazon S3.

Use cases:

- Data exploration
- Data validation
- Serverless analytics queries

Example:

```sql
SELECT
    *
FROM retail_sales
LIMIT 10;
```

---

# Snowflake Data Warehouse

Snowflake is used as the analytical warehouse layer.

Database:

```text
RETAIL_ANALYTICS
```

Schemas:

```text
RAW
 |
STAGING
 |
SNAPSHOTS
```

Snowflake responsibilities:

- Store analytical datasets
- Execute scalable SQL workloads
- Support analytics workloads

---

# dbt Transformations

The transformation layer is implemented using dbt.

dbt is responsible for:

- SQL-based transformations
- Data modeling
- Data quality testing
- Analytics-ready datasets

Architecture:

```text
RAW DATA

    |

STAGING MODELS

    |

ANALYTICAL MARTS
```

---

# Staging Layer

The staging layer cleans and standardizes raw datasets.

---

## stg_sales

Transforms raw sales data.

Main columns:

```text
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

```text
STORE_ID
ITEM_ID
WM_YR_WK
SELL_PRICE
```

---

## stg_calendar

Creates a calendar dimension.

Columns:

```text
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

The fact table provides a structured layer for downstream analytics and reporting.

---

## Fact Sales Long Table

The original M5 sales dataset is provided in a wide format:

```text
D_1
D_2
D_3
...
D_1913
```

This project converts the sales data into a normalized long format using Snowflake UNPIVOT functionality.

Output structure:

```text
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
- Better compatibility with analytical workloads

---

# Analytics Mart

## daily_sales_metrics

Creates business-ready analytical metrics.

Examples:

- Total daily sales
- Sales by store
- Sales trends over time

---

# dbt Snapshots

dbt snapshots are used to track historical changes.

Example:

```text
prices_snapshot
```

Tracks changes in:

```text
SELL_PRICE
```

over time.

Benefits:

- Historical price tracking
- Slowly changing dimension concepts

---

# Data Quality Testing

Implemented dbt data quality checks:

- not_null validation
- unique validation

Run:

```bash
dbt test
```

Example result:

```text
15 tests passed
```

---

# Running the Project

## Install Python dependencies

```bash
pip install -r requirements.txt
```

---

## Upload data to S3

Configure environment variables:

```env
AWS_BUCKET_NAME=<your_bucket_name>
```

Run:

```bash
python src/ingestion/upload_to_s3.py
```

---

## Install dbt dependencies

```bash
dbt deps
```

---

## Run dbt transformations

```bash
dbt run
```

---

## Run data quality tests

```bash
dbt test
```

---

## Run snapshots

```bash
dbt snapshot
```

---

# Key Skills Demonstrated

- Cloud Data Architecture
- AWS S3 Data Lake
- AWS Glue Data Catalog
- Amazon Athena Analytics
- Snowflake Cloud Data Warehouse
- dbt Analytics Engineering
- ELT Pipeline Development
- SQL Data Modeling
- Data Quality Testing
- Retail Analytics

---

# Project Outcome

This project demonstrates the design and implementation of a modern cloud analytics platform that transforms raw retail data into trusted analytical datasets.

The platform combines:

- AWS cloud services for ingestion and storage
- Snowflake for analytical processing
- dbt for scalable transformations and testing

The final output is an analytics-ready data platform suitable for retail reporting and downstream analysis.

---

# Future Improvements

Potential future enhancements:

- Add Airflow orchestration
- Add CI/CD pipeline with GitHub Actions
- Connect Snowflake models to BI tools
- Deploy dbt workflows in a cloud environment
