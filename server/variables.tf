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

variable "tags" {
  type = object({
    Project     = string
    Environment = string
  })

  default = {
    Project     = "nsse",
    Environment = "production"
  }
}

variable "ec2_resources" {
  type = object({
    key_pair_name    = string
    instance_profile = string
    instance_role    = string
    ssh_security_group = string
    ssh_source_ip = string

  })

  default = {
    key_pair_name    = "nsse-production-key-pair"
    instance_profile = "nsse-production-instance-profile"
    instance_role    = "nsse-production-instance-role"
    ssh_security_group = "allow-ssh"
    ssh_source_ip = "193.186.4.203/32"
  }
}

variable "vpc_resources" {
  type = object({
    vpc = string
  })

  default = {
    vpc = "nsse-vpc"
  }
}