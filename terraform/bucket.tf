# Create a separate bucket.tf file
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