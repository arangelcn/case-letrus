#============================
# Definindo local AWS
variable "region" {
  type    = string
  default = "ap-southeast-1"
}

#============================

# Definindo zonas do datalake
variable "raw_data_bucket" {
  type    = string
  default = "raw-lake-prod"
}

variable "processed_data_bucket" {
  type    = string
  default = "processed-lake-prod"
}

variable "curated_data_bucket" {
  type    = string
  default = "curated-lake-prod"
}


