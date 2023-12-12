# Terraform AWS Infrastructure Project

## Overview

This Terraform project automates the provisioning and management of infrastructure on Amazon Web Services (AWS). It uses Terraform to define and deploy resources, making it easy to maintain and scale your AWS infrastructure.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html)
- AWS CLI with configured credentials
- (Optional) AWS IAM user with necessary permissions

## Project Structure

The project is organized as follows:

   ```terraform-aws-project/
   ├── main.tf # Main Terraform configuration file
   ├── variables.tf # Variable declarations
   ├── datalake.tf # Datalake formation code
   ├── glue.tf # Glue and Athena catalog formation code
   ├── iam_groups.tf # Groups IAM setup
   ├── s3.tf # IAM policys setup
   ├── terraform.tfvars # Terraform variables file (gitignored)
   ├── README.md # Project documentation

1. Clone the repository:

   ```bash
   git clone https://github.com/arangelcn/case-letrus.git
   cd case-letrus```


2. Run

- terraform init
- terraform validate
- terraform plan
- terraform apply


3. Configuração na AWS 

- Para executar todos os recursos é necessário criar permissão no Lake Formation para o bucket inep. 