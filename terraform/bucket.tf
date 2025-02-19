# S3 bucket for logs and state
resource "aws_s3_bucket" "regtech_iac" {
  bucket = var.bucket_name
  force_destroy = true
}

# Enable versioning
resource "aws_s3_bucket_versioning" "regtech_iac_versioning" {
  bucket = aws_s3_bucket.regtech_iac.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Server-side encryption configuration
resource "aws_s3_bucket_server_side_encryption_configuration" "regtech_iac_encrypt_config" {
  bucket = aws_s3_bucket.regtech_iac.bucket
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_encryption_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

# Block public access
resource "aws_s3_bucket_public_access_block" "regtech_iac_public_access_block" {
  bucket = aws_s3_bucket.regtech_iac.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}