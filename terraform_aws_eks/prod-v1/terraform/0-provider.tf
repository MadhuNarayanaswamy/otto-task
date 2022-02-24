provider "aws" {
  region = var.aws_region
  profile = var.stage
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

}

