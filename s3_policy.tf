# Define policys

# Política de Acesso ao Bucket Raw
resource "aws_iam_policy" "raw_data_s3_policy" {
  name        = "rawS3Policy"
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
        "arn:aws:s3:::${var.raw_data_bucket}",
        "arn:aws:s3:::${var.raw_data_bucket}"
      ]
    }
  ]
}
EOF
}

# Política de Acesso ao Bucket Processed
resource "aws_iam_policy" "processed_data_s3_policy" {
  name        = "processedS3Policy"
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
        "arn:aws:s3:::${var.processed_data_bucket}",
        "arn:aws:s3:::${var.processed_data_bucket}"
      ]
    }
  ]
}
EOF
}

# Política de Acesso ao Bucket Curated
resource "aws_iam_policy" "curated_data_s3_policy" {
  name        = "curatedS3Policy"
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
        "arn:aws:s3:::${var.curated_data_bucket}",
        "arn:aws:s3:::${var.curated_data_bucket}"
      ]
    }
  ]
}
EOF
}

# ------------------------------------------

# Apply policys to S3

# Associação da Política de Acesso ao Bucket Raw ao Grupo de Engenheiros de Dados
resource "aws_iam_group_policy_attachment" "data_engineer_raw_s3_attachment" {
  group      = aws_iam_group.data_eng_group.name
  policy_arn = aws_iam_policy.raw_data_s3_policy.arn
}

# Associação da Política de Acesso ao Bucket Processed ao Grupo de Engenheiros de Dados
resource "aws_iam_group_policy_attachment" "data_engineer_processed_s3_attachment" {
  group      = aws_iam_group.data_eng_group.name
  policy_arn = aws_iam_policy.processed_data_s3_policy.arn
}

# Associação da Política de Acesso ao Bucket Curated ao Grupo de Engenheiros de Dados
resource "aws_iam_group_policy_attachment" "data_engineer_curated_s3_attachment" {
  group      = aws_iam_group.data_eng_group.name
  policy_arn = aws_iam_policy.curated_data_s3_policy.arn
}

# Associação da Política de Acesso ao Bucket Processed ao Grupo de Cientistas de Dados
resource "aws_iam_group_policy_attachment" "data_science_processed_s3_attachment" {
  group      = aws_iam_group.data_science_group.name
  policy_arn = aws_iam_policy.processed_data_s3_policy.arn
}

# Associação da Política de Acesso ao Bucket Curated ao Grupo de Cientistas de Dados
resource "aws_iam_group_policy_attachment" "data_science_curated_s3_attachment" {
  group      = aws_iam_group.data_science_group.name
  policy_arn = aws_iam_policy.curated_data_s3_policy.arn
}

# ------------------------------------------
