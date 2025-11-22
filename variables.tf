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
      role_arn    = "arn:aws:iam::760023434898:user/iamadmin"
      external_id = "de32345c-2ca9-43e9-b7b1-603db7316339"
  }
}