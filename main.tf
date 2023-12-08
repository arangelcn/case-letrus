# basic terraform config for AWS
terraform {
  required_version = ">=1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "danielgilterraformstate"
    key                  = "pipeline-github/terraform.tfstate"
  }

}

provider "aws" {
  region = "us-east-1"

  # set default tags to terraform managed resources
  default_tags {
    tags = {
      owner      = "antoniorangel"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "danielgil-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "eu-central-1"
  }
}
