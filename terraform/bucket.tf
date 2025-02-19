# Create a separate bucket.tf file
provider "aws" {
  region = "us-east-1"
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key 
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "regtech-iac"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}