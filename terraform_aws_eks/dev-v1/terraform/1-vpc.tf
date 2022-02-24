resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr #"10.0.0.0/16"

  tags = {
    Name = "main"
  }

}


