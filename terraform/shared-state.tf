terraform {
  backend "s3" {
    encrypt = true
    bucket = "mongeese-footprints-terraform-state-storage-s3"
    dynamodb_table = "dynamodb_terraform_state_lock"
    region = "us-east-1"
    key = "terraform-state/repository/footprints-terraform-state"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state_storage_s3" {
  bucket = "mongeese-footprints-terraform-state-storage-s3"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags {
    Name = "S3 Remote Terraform State Store"
  }
}

resource "aws_dynamodb_table" "dynamodb_terraform_state_lock" {
  name = "dynamodb_terraform_state_lock"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true
  }

  tags {
    Name = "DynamoDB Terraform State Lock Table"
  }
}