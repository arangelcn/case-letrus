# basic terraform config for AWS
terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

}

provider "aws" {
  region = "ap-southeast-1"

  access_key = "AKIAQEBCKATHVDBCMN6J"
  secret_key = "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"

  # set default tags to terraform managed resources
  default_tags {
    tags = {
      owner      = "antoniorangel"
      managed-by = "terraform"
    }
  }
}