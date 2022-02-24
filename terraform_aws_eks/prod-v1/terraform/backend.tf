terraform {
  backend "s3" {
    bucket = "terraformstate-prod-v1-test"
    key    = "terraform.tfstate"
    region = "us-east-1"
     profile = "prod"
  }
}
