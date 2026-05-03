variable "region" {
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
    Project     = "not-so-simple-ecommerce"
    Environment = "production"
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

variable "ec2_resources" {
  type = object({
    key_pair_name      = string
    instance_profile   = string
    instance_role      = string
    ssh_security_group = string
    ssh_source_ip      = string
  })

  default = {
    key_pair_name      = "nsse-production-key-pair"
    instance_profile   = "nsse-production-instance-profile"
    instance_role      = "nsse-production-instance-role"
    ssh_security_group = "Allow SSH"
    ssh_source_ip      = "177.222.150.146/32"
  }
}

variable "control_plane_launch_template" {
  type = object({
    name                                 = string
    disable_api_stop                     = bool
    disable_api_termination              = bool
    instance_type                        = string
    instance_initiated_shutdown_behavior = string
    ebs = object({
      size                  = number
      delete_on_termination = bool
    })

  })

  default = {
    name                                 = "nsse-production-debian-control-plante"
    disable_api_stop                     = true
    disable_api_termination              = true
    instance_type                        = "t3.micro"
    instance_initiated_shutdown_behavior = "terminate"
    ebs = {
      size                  = 20
      delete_on_termination = true
    }
  }
}

variable "worker_launch_template" {
  type = object({
    name                                 = string
    disable_api_stop                     = bool
    disable_api_termination              = bool
    instance_type                        = string
    instance_initiated_shutdown_behavior = string
    ebs = object({
      size                  = number
      delete_on_termination = bool
    })

  })

  default = {
    name                                 = "nsse-production-debian-worker"
    disable_api_stop                     = true
    disable_api_termination              = true
    instance_type                        = "t3.micro"
    instance_initiated_shutdown_behavior = "terminate"
    ebs = {
      size                  = 20
      delete_on_termination = true
    }
  }
}

variable "control_plane_auto_scaling_group" {
  type = object({
    name                      = string
    max_size                  = number
    min_size                  = number
    desired_capacity          = number
    health_check_grace_period = number
    health_check_type         = string
    instance_maintenance_policy = object({
      min_healthy_percentage = number
      max_healthy_percentage = number
    })
  })

  default = {
    name                      = "nsse-production-control-plane-asg"
    max_size                  = 1
    min_size                  = 1
    desired_capacity          = 1
    health_check_grace_period = 180
    health_check_type         = "EC2"
    instance_maintenance_policy = {
      min_healthy_percentage = 100
      max_healthy_percentage = 110
    }
  }
}

variable "worker_auto_scaling_group" {
  type = object({
    name                      = string
    max_size                  = number
    min_size                  = number
    desired_capacity          = number
    health_check_grace_period = number
    health_check_type         = string
    instance_maintenance_policy = object({
      min_healthy_percentage = number
      max_healthy_percentage = number
    })
  })

  default = {
    name                      = "nsse-production-worker-asg"
    max_size                  = 1
    min_size                  = 1
    desired_capacity          = 1
    health_check_grace_period = 180
    health_check_type         = "EC2"
    instance_maintenance_policy = {
      min_healthy_percentage = 100
      max_healthy_percentage = 110
    }
  }
}