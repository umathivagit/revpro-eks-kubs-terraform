variable "profile" {
  description = "AWS User account Profile"
  default = "default"
}

variable "region" {
  default = "us-east-1"
}

variable "key" {
  description = "Enter Key name"
  default = "revpro-prod-cluster-key"
}

variable "sub_ids" {
  default = []
}

variable "instance-ami" {
  default = "ami-07d6c8e62ce328a10" # AMI of N.Virginia region
}

variable "instance_type" {
  default = "m5a.large"
}


variable "cluster-name" {
  description = "Cluster Name"
}

variable "server-name" {
  description = "Ec2 Server Name"
}

variable "vpc_name" {
  description = "VPC name"
}
  
