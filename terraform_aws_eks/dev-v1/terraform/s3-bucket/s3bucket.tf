
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

}

provider "aws" {
  region  = "us-east-1"
  profile = "dev"
}
resource "aws_s3_bucket" "tf_remote_tate" {
  bucket = "terraformstate-dev-v1-test"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  lifecycle {
    prevent_destroy = true
  }
}

#.... DynamoDB for locking the state file

resource "aws_dynamodb_table" "tf_state_locking" {
  hash_key = "LockID"
  name     = "terraform-state-locking-dev-test-v1"
  attribute {
    name = "LockID"
    type = "S"
  }
  billing_mode = "PAY_PER_REQUEST"
}