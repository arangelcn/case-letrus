# basic terraform config for AWS
terraform {
  required_version = ">=1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# provide AWS
provider "aws" {
  region = "us-east-1"

  access_key = "AKIAQEBCKATHQ5DJNCLN"
  secret_key = "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"

  # set default tags to terraform managed resources
  default_tags {
    tags = {
      owner      = "antoniorangel"
      managed-by = "terraform"
    }
  }
}