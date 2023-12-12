# Incluindo variáveis
terraform {
  backend "local" {}
}

# Criação dos Buckets
resource "aws_s3_bucket" "raw_data_bucket" {
  bucket = var.raw_data_bucket
}

resource "aws_s3_object" "inep_folder" {
  bucket = aws_s3_bucket.raw_data_bucket.id
  key    = "inep/"
  acl    = "private"
}

resource "aws_lakeformation_resource" "raw_data_bucket" {
  arn      = aws_s3_bucket.raw_data_bucket.arn
}

resource "aws_s3_bucket" "processed_data_bucket" {
  bucket = var.processed_data_bucket
}

resource "aws_lakeformation_resource" "processed_data_bucket" {
  arn      = aws_s3_bucket.processed_data_bucket.arn
}

resource "aws_s3_bucket" "curated_data_bucket" {
  bucket = var.curated_data_bucket
}

resource "aws_lakeformation_resource" "curated_data_bucket" {
  arn      = aws_s3_bucket.curated_data_bucket.arn
}
