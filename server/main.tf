provider "aws" {
  region = var.region
  assume_role {
    role_arn    = var.assume_role.role_arn
    external_id = var.assume_role.external_id
  }
}

terraform {


  backend "s3" {
    bucket         = "not-so-simple-ecommerce-state-files-terraform"
    key            = "server/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "not-so-simple-ecommerce-terraform-state-locking"
  }
}


# Configure the AWS Provider
