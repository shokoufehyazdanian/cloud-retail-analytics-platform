import boto3
import os
from pathlib import Path
from dotenv import load_dotenv


BASE_DIR = Path(__file__).resolve().parents[2]

load_dotenv(BASE_DIR / ".env")

BUCKET_NAME = os.getenv("AWS_BUCKET_NAME")
print("Bucket:", BUCKET_NAME)
LOCAL_DATA_PATH = Path("data/raw")

S3_PREFIX = "raw/"


def upload_file_to_s3(file_path, bucket, s3_key):
    s3 = boto3.client("s3")

    s3.upload_file(
        str(file_path),
        bucket,
        s3_key
    )

    print(f"Uploaded {file_path.name} -> s3://{bucket}/{s3_key}")


def upload_dataset():

    files = [
        "calendar.csv",
        "sales_train_validation.csv",
        "sell_prices.csv"
    ]

    for file in files:

        local_file = LOCAL_DATA_PATH / file

        s3_key = S3_PREFIX + file

        upload_file_to_s3(
            local_file,
            BUCKET_NAME,
            s3_key
        )


if __name__ == "__main__":
    upload_dataset()