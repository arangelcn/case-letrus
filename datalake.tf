# Incluindo variáveis
terraform {
  backend "local" {}
}

resource "aws_s3_bucket" "raw_data_bucket" {
  bucket = var.raw_data_bucket
}

resource "aws_lakeformation_resource" "raw_data_bucket" {
  arn      = aws_s3_bucket.raw_data_bucket.arn
  role_arn = aws_iam_policy.raw_data_s3_policy.arn
}

resource "aws_s3_bucket" "processed_data_bucket" {
  bucket = var.processed_data_bucket
}

resource "aws_lakeformation_resource" "processed_data_bucket" {
  arn      = aws_s3_bucket.processed_data_bucket.arn
  role_arn = aws_iam_policy.processed_data_s3_policy.arn
}

resource "aws_s3_bucket" "curated_data_bucket" {
  bucket = var.curated_data_bucket
}

resource "aws_lakeformation_resource" "curated_data_bucket" {
  arn      = aws_s3_bucket.curated_data_bucket.arn
  role_arn = aws_iam_policy.curated_data_s3_policy.arn
}

# Associação da Política de Acesso ao Bucket Raw ao Grupo de Engenheiros de Dados
resource "aws_iam_group_policy_attachment" "data_engineer_raw_s3_attachment" {
  group      = var.data_engineer_group_arn
  policy_arn = aws_iam_policy.raw_data_s3_policy.arn
}

# Associação da Política de Acesso ao Bucket Processed ao Grupo de Engenheiros de Dados
resource "aws_iam_group_policy_attachment" "data_engineer_processed_s3_attachment" {
  group      = var.data_engineer_group_arn
  policy_arn = aws_iam_policy.processed_data_s3_policy.arn
}

# Associação da Política de Acesso ao Bucket Curated ao Grupo de Engenheiros de Dados
resource "aws_iam_group_policy_attachment" "data_engineer_curated_s3_attachment" {
  group      = var.data_engineer_group_arn
  policy_arn = aws_iam_policy.curated_data_s3_policy.arn
}

# Associação da Política de Acesso ao Bucket Processed ao Grupo de Cientistas de Dados
resource "aws_iam_group_policy_attachment" "data_science_processed_s3_attachment" {
  group      = var.data_sci_group_arn
  policy_arn = aws_iam_policy.processed_data_s3_policy.arn
}

# Associação da Política de Acesso ao Bucket Curated ao Grupo de Cientistas de Dados
resource "aws_iam_group_policy_attachment" "data_science_curated_s3_attachment" {
  group      = var.data_sci_group_arn
  policy_arn = aws_iam_policy.curated_data_s3_policy.arn
}