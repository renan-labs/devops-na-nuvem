variable "region" {
  type    = string
  default = "us-east-1"
}

variable "assume_role" {
  type = object({
    role_arn    = string
    external_id = string
  })

  default = {
    role_arn    = "arn:aws:iam::760023434898:role/terraform-role"
    external_id = "de32345c-2ca9-43e9-b7b1-603db7316339"
  }
}

variable "vpc" {
  type = object({
    name                  = string
    cidr_block            = string
    internet_gateway_name = string
  })

  default = {
    name                  = "nsse-vpc"
    cidr_block            = "10.0.0.0/24"
    internet_gateway_name = "internet_gateway"
  }
}