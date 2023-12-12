# load csv in AWS Lakeformation
import pandas as pd
import boto3
import os
import json

class ETL:

    def __init__(self):
        # Init boto3
        AWS_S3_CREDS = {
            "aws_access_key_id": os.getenv("AWS_ACCESS_KEY"),
            "aws_secret_access_key": os.getenv("AWS_SECRET")
        }

        self.s3 = boto3.client('s3', **AWS_S3_CREDS)

    def transform_csv_to_parquet(self, input_path, output_path):
        # Read the CSV file
        data = pd.read_csv(input_path, sep=',')

        # Extract the columns
        self.extract_columns(data)

        # Transform all values to string
        data = data.astype(str) 

        # Write the data to Parquet format
        data.to_parquet(output_path)
        print("Ok! Data transformed!")

    def extract_columns(self, data):
        # Assuming you have a DataFrame named "df"
        column_types = [{'column': column, 'type': str(dtype)} for column, dtype in data.dtypes.items()]
        # Specify the file path where you want to save the JSON
        file_path = 'inep_data_columns.json'

        # Save the JSON to the file
        with open(file_path, 'w') as file:
            json.dump(column_types, file)

    def load_parquet(self, data_path, filename):
        # Load csv in s3
        self.s3.upload_file(data_path, 'raw-lake-prod', '%s/%s' % ('inep', filename))
        print("Ok! Data loaded!")

if __name__ == '__main__':
    etl = ETL()

    # Loading data
    data_path = 'assets/MICRODADOS_ENEM_ESCOLA.csv'
    output_path = 'assets/MICRODADOS_ENEM_ESCOLA.parquet'
    filename_output = 'MICRODADOS_ENEM_ESCOLA.parquet'

    etl.transform_csv_to_parquet(data_path, output_path)

    etl.load_parquet(output_path, filename_output)