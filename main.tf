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

  access_key = "AKIAQEBCKATH5DYEGKHS"
  secret_key = "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"

  # set default tags to terraform managed resources
  default_tags {
    tags = {
      owner      = "antoniorangel"
      managed-by = "terraform"
    }
  }
}