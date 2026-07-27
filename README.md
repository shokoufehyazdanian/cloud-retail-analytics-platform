# Cloud Retail Analytics Platform

A cloud-based analytics engineering project built on **AWS, Snowflake, and dbt** using the **M5 Retail Sales Forecasting Dataset**.

The goal of this project is to demonstrate a modern cloud analytics platform architecture including:

- Data ingestion into Amazon S3 Data Lake
- AWS Glue Data Catalog integration
- Serverless analytics using Amazon Athena
- Cloud data warehousing with Snowflake
- ELT transformations using dbt
- Data quality validation

---

# Architecture

```
                    M5 Retail Dataset
                           |
                           v
                 Python S3 Ingestion
                     (boto3)
                           |
                           v
                    Amazon S3
                 Raw Data Lake Layer
                           |
                           v
                    AWS Glue
              Data Catalog / Crawler
                           |
                           v
                  Amazon Athena
              Serverless SQL Analytics
                           |
                           v
                    Snowflake
             Cloud Data Warehouse Layer
                           |
                           v
                       dbt
            Transformations & Modeling
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

## Programming

- Python
- boto3
- Pandas

## Data Quality

- dbt tests
- not_null tests
- unique tests

## Development Tools

- Git
- GitHub
- VS Code

---

# Dataset

This project uses the **M5 Retail Sales Forecasting Dataset**.

The dataset contains:

- Daily retail sales history
- Product information
- Store information
- Calendar events
- Weekly product prices


Main datasets:

```
sales_train_validation.csv
sell_prices.csv
calendar.csv
```

---

# Project Structure

```
cloud-retail-analytics-platform/

│
├── aws/
│   │
│   ├── s3/
│   │   └── bucket_structure.md
│   │
│   ├── glue/
│   │   └── crawler_config.md
│   │
│   └── athena/
│       └── queries.sql
│
├── src/
│   │
│   └── ingestion/
│       └── upload_to_s3.py
│
├── dbt/
│   │
│   └── cloud_retail_dbt/
│       │
│       ├── models/
│       │   │
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

# Cloud Data Pipeline

## 1. Data Lake Layer - Amazon S3

Raw retail datasets are uploaded into Amazon S3 using a Python ingestion script.

The ingestion process uses:

- Python
- boto3
- AWS SDK


Example:

```
Local CSV Files

        |

        v

Python boto3 ingestion

        |

        v

Amazon S3 Data Lake
```

S3 structure:

```
retail-data-lake/

└── raw/

    ├── calendar.csv

    ├── sales_train_validation.csv

    └── sell_prices.csv
```

---

# 2. AWS Glue Data Catalog

AWS Glue is used for schema discovery and metadata management.

The Glue crawler:

- Reads datasets stored in S3
- Detects schemas
- Creates catalog tables
- Enables SQL querying through Athena


Configuration:

```
aws/glue/crawler_config.md
```

---

# 3. Amazon Athena Analytics Layer

Amazon Athena provides serverless SQL querying directly on data stored in Amazon S3.

Example queries:

```
aws/athena/queries.sql
```

Use cases:

- Exploring raw datasets
- Validating ingestion
- Running analytical queries before loading into warehouse

---

# 4. Snowflake Cloud Data Warehouse

Snowflake is used as the analytical warehouse.

Database:

```
RETAIL_ANALYTICS
```

Schema structure:

```
RAW

 |

STAGING

 |

SNAPSHOTS

 |

MARTS
```

---

# dbt Transformation Layer

dbt is used to transform raw warehouse data into analytics-ready models.

Transformation flow:

```
RAW

 |

STAGING

 |

MARTS
```

---

# Staging Models

## stg_sales

Cleans and standardizes retail sales data.

Main fields:

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

Weekly product pricing information.

Columns:

```
STORE_ID
ITEM_ID
WM_YR_WK
SELL_PRICE
```

---

## stg_calendar

Calendar dimension.

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

A sales fact table is created by combining:

- Sales information
- Calendar attributes
- Pricing information


---

## Fact Sales Long Table

The original M5 dataset uses a wide format:

```
D_1
D_2
D_3
...
D_1913
```

The project converts the dataset into a normalized long format:

```
ID
ITEM_ID
STORE_ID
D
SALES
```

using Snowflake UNPIVOT functionality.

Benefits:

- Easier analytics
- Better time-series analysis
- Improved downstream querying

---

# dbt Snapshots

dbt snapshots are used to track historical changes.

Example:

```
prices_snapshot
```

Tracks:

```
SELL_PRICE
```

changes over time.

This enables historical price analysis.

---

# Data Quality Testing

Implemented dbt tests:

- not_null validation
- unique validation


Example:

```
dbt test
```

Result:

```
All tests passed
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

# Environment Configuration

Create a `.env` file:

```
AWS_BUCKET_NAME=
AWS_REGION=

SNOWFLAKE_ACCOUNT=
SNOWFLAKE_USER=
SNOWFLAKE_PASSWORD=
SNOWFLAKE_DATABASE=
SNOWFLAKE_SCHEMA=
```


---

# Key Skills Demonstrated

This project demonstrates practical experience with:

- Cloud Data Lake Architecture
- AWS S3 Data Ingestion
- AWS Glue Data Catalog
- Amazon Athena
- Snowflake Data Warehouse
- dbt ELT Pipelines
- SQL Data Modeling
- Data Quality Engineering
- Python Cloud Automation

---

# Future Improvements

Possible extensions:

- Infrastructure as Code using Terraform
- Automated deployment with CI/CD
- Airflow orchestration
- AWS monitoring and logging
