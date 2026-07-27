# Amazon S3 Data Lake Structure

## Overview

Amazon S3 is used as the raw data lake storage layer for the Cloud Retail Analytics Platform.

The raw layer stores original retail datasets before any transformation or processing.

The ingestion process uploads files from the local environment into Amazon S3 using Python and boto3.

---

# Bucket Structure

Example bucket:

```
retail-analytics-data-lake
```

S3 folder structure:

```
retail-analytics-data-lake/

└── raw/

    ├── calendar.csv

    ├── sales_train_validation.csv

    └── sell_prices.csv
```

---

# Data Lake Layers

## Raw Layer

Location:

```
s3://retail-analytics-data-lake/raw/
```

Purpose:

- Store original source files
- Preserve immutable raw data
- Enable downstream processing
- Maintain data lineage


Example files:

```
calendar.csv

sales_train_validation.csv

sell_prices.csv
```

---

# Data Ingestion

Data is uploaded into Amazon S3 using:

- Python
- boto3 AWS SDK


Pipeline:

```
Local Dataset

        |

        v

Python Ingestion Script

(upload_to_s3.py)

        |

        v

Amazon S3 Raw Layer
```

---

# Data Processing Flow

```
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

        |

        v

Snowflake Cloud Warehouse

        |

        v

dbt Transformations
```

---

# Design Principles

## Separation of Storage and Processing

Amazon S3 provides scalable and cost-effective storage, while processing and analytics are handled by services such as Athena, Snowflake, and dbt.

---

## Immutable Raw Data

Raw files are stored without modification to maintain data consistency, reproducibility, and data lineage.

---

## Metadata Management

AWS Glue Data Catalog maintains schema information for datasets stored in Amazon S3 and enables serverless querying through Amazon Athena.