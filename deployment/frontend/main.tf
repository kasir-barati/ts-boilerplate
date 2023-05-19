terraform {
  required_version = ">= 1.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket  = var.TFSTATE_BUCKET_NAME
    key     = "projectname-frontend.tfstate"
    region  = var.AWS_REGION
    acl     = "bucket-owner-full-control"
    encrypt = true
  }
}

provider "aws" {
  region     = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}


locals {
  stage_name = "dev"
}
