# basic terraform config for AWS
terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }

}

variable "AWS_ACCESS_KEY_ID" { type= string } 
variable "AWS_ACCESS_KEY_SECRET" { type= string } 

provider "aws" {
  region = "ap-southeast-1"

  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_ACCESS_KEY_SECRET

  # set default tags to terraform managed resources
  default_tags {
    tags = {
      owner      = "antoniorangel"
      managed-by = "terraform"
    }
  }
}