# Definindo Grupos
variable "data_engineer_group_arn" {
  type    = string
  default = "arn:aws:iam::008661894351:group/data-eng"
}

variable "data_sci_group_arn" {
  type    = string
  default = "arn:aws:iam::008661894351:group/data-science"
}

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
  default = "raw-datalake-prod"
}

variable "processed_data_bucket" {
  type    = string
  default = "processed-datalake-prod"
}

variable "curated_data_bucket" {
  type    = string
  default = "curated-datalake-prod"
}


