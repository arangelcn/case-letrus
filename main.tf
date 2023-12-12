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

  # set default tags to terraform managed resources
  default_tags {
    tags = {
      owner      = "antoniorangel"
      managed-by = "terraform"
    }
  }
}