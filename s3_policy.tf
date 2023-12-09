# Política de Acesso ao Bucket Raw
resource "aws_iam_policy" "raw_data_s3_policy" {
  name        = "RawDataS3Policy"
  description = "Policy for accessing the raw data S3 bucket"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::${var.raw_data_bucket}/*",
        "arn:aws:s3:::${var.raw_data_bucket}"
      ]
    }
  ]
}
EOF
}

# Política de Acesso ao Bucket Processed
resource "aws_iam_policy" "processed_data_s3_policy" {
  name        = "ProcessedDataS3Policy"
  description = "Policy for accessing the processed data S3 bucket"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::${var.processed_data_bucket}/*",
        "arn:aws:s3:::${var.processed_data_bucket}"
      ]
    }
  ]
}
EOF
}

# Política de Acesso ao Bucket Curated
resource "aws_iam_policy" "curated_data_s3_policy" {
  name        = "CuratedDataS3Policy"
  description = "Policy for accessing the curated data S3 bucket"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::${var.curated_data_bucket}/*",
        "arn:aws:s3:::${var.curated_data_bucket}"
      ]
    }
  ]
}
EOF
}