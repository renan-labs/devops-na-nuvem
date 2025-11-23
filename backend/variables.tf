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
  type = map(string)
  default = {
    Projetc     = "not-so-simple-ecommerce"
    Environment = "production"
  }
}

variable "remote_backend" {
  type = object({
    bucket = string
    state_locking = object({
      dynamodb_table_name          = string
      dynamodb_table_billing_mode        = string
      dynamodb_table_hash_key      = string
      dynamodb_table_hash_key_type = string
    })
  })

  default = {
    bucket = "not-so-simple-ecommerce-state-files-terraform"
    state_locking = {
      dynamodb_table_name          = "not-so-simple-ecommerce-terraform-state-locking"
      dynamodb_table_billing_mode        = "PAY_PER_REQUEST"
      dynamodb_table_hash_key      = "LockID"
      dynamodb_table_hash_key_type = "S"
    }
  }
}