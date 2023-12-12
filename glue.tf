# ------------------------------------------
# Criação do catalogo
resource "aws_glue_catalog_database" "inep_data" {
  name = "inep_data_catalog"
}

resource "aws_iam_role" "role_athena" {
  name = "role_athena"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "glue.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_glue_crawler" "crawler_inep" {
  database_name = aws_glue_catalog_database.inep_data.name
  name          = "crawler_inep"
  role          = aws_iam_role.role_athena.arn

  s3_target {
    path = "s3://${var.raw_data_bucket}/inep/"
  }
}

resource "aws_iam_role" "glue_role" {
  name = "glue_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "athena.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_glue_catalog_table" "aws_glue_catalog_table" {
  name          = "microdados_inep"
  database_name = "inep_data_catalog"

  table_type = "EXTERNAL_TABLE"

  parameters = {
    EXTERNAL              = "TRUE"
    "parquet.compression" = "SNAPPY"
  }

  storage_descriptor {
    location      = "s3://${var.raw_data_bucket}/inep"
    input_format  = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"

    ser_de_info {
      name                  = "inep_deserializer"
      serialization_library = "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"

      parameters = {
        "serialization.format" = 1
      }
    }

    columns {
      name = "NU_ANO"
      type = "string"
    }

    columns {
      name = "CO_UF_ESCOLA"
      type = "string"
    }

    columns {
      name = "SG_UF_ESCOLA"
      type = "string"
    }

    columns {
      name = "CO_MUNICIPIO_ESCOLA"
      type = "string"
    }

  }

}

