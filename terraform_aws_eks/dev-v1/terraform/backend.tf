terraform {
  backend "s3" {
    bucket = "terraformstate-dev-v1-test"
    key    = "terraform.tfstate"
    region = "us-east-1"
     profile = "dev"
  }
}
