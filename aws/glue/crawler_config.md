# AWS Glue Crawler Configuration

## Overview

AWS Glue Crawler is used to automatically discover the schema of raw retail datasets stored in Amazon S3 and create metadata tables in the AWS Glue Data Catalog.

---

## Data Source

The crawler reads raw CSV files from the S3 data lake.

Example:


s3://retail-data-lake/raw/


Dataset files:

- calendar.csv
- sales_train_validation.csv
- sell_prices.csv

---

## Crawler Configuration

Name:


retail-sales-crawler


Data store:


Amazon S3


File format:


CSV


Crawler schedule:


On demand


---

## Output

The crawler creates tables in AWS Glue Data Catalog.

Example database:


retail_raw


Tables:


sales_raw
prices_raw
calendar_raw


---

## Pipeline Flow


CSV Files
|
v
Amazon S3
|
v
AWS Glue Crawler
|
v
AWS Glue Data Catalog
|
v
Amazon Athena


---

## Purpose

The Glue Catalog provides centralized metadata management and enables serverless SQL querying through Amazon Athena.