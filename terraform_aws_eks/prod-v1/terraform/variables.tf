#provider
variable "aws_region" {
  type =  string 
}
variable "stage" {
  type        = string
  description = "eg dev , test, prod"
}

#vpc_cidr
variable "vpc_cidr" {
  type = string
}

# subnet pr 1a 
variable "pr-us-east-1a_subnet_cidr_block" {
  type = string
}
variable "az-us-east-1a" {
  type = string
}

# subnet pr 1b

variable "pr-us-east-1b_subnet_cidr_block" {
  type = string
}
variable "az-us-east-1b" {
  type = string
}

# subnet pu 1a
variable "pu-us-east-1a_subnet_cidr_block" {
  type = string
}

# subnet pu 1b
variable "pu-us-east-1b_subnet_cidr_block" {
  type = string
}

#eks

variable "eks_cluster_name" {
  type = string
}

#instance type and nodes 
variable "node_group_0" {
  type = string
}


variable "pn0-instance_types" {
  type        = list(string)
  description = "Set of instance types associated with the EKS Node Group. Defaults to [\"t3.micro\"]. Terraform will only perform drift detection if a configuration value is provided"
}

variable "pn0-desired_size" {
  type        = number
  description = "Desired number of worker nodes"
}

variable "pn0-max_size" {
  type        = number
  description = "The maximum size of the AutoScaling Group"
}

variable "pn0-min_size" {
  type        = number
  description = "The minimum size of the AutoScaling Group"
}

variable "pn0-max_unavailable" {
  type        = number
}


#node 2 
variable "node_group_1" {
  type = string
}

variable "pn1-instance_types" {
  type        = list(string)
  description = "Set of instance types associated with the EKS Node Group. Defaults to [\"t3.medium\"]. Terraform will only perform drift detection if a configuration value is provided"
}

variable "pn1-desired_size" {
  type        = number
  description = "Desired number of worker nodes"
}

variable "pn1-max_size" {
  type        = number
  description = "The maximum size of the AutoScaling Group"
}

variable "pn1-min_size" {
  type        = number
  description = "The minimum size of the AutoScaling Group"
}

variable "pn1-max_unavailable" {
  type        = number
}
