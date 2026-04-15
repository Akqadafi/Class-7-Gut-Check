terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Use latest version if possible
    }
  }

  backend "s3" {
    bucket  = "class7-gutcheck-akqadafi"                 # Name of the S3 bucket
    key     = "jenkins-lab/terraform.tfstate"        # The name of the state file in the bucket
    region  = "us-west-2"                          # Use a variable for the region
    encrypt = true                                 # Enable server-side encryption (optional but recommended)
  } 
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_s3_bucket" "frontend" {
  bucket_prefix = "jenkins-bucket-"
  force_destroy = true
  

  tags = {
    Name = "Jenkins Bucket"
  }
}
resource "aws_s3_bucket_public_access_block" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.frontend.id

  depends_on = [aws_s3_bucket_public_access_block.frontend]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = ["s3:GetObject"]
        Resource  = "${aws_s3_bucket.frontend.arn}/*"
      }
    ]
  })
}

locals {
  screenshot_files = fileset("${path.module}/Screenshots", "*.png")
}

resource "aws_s3_object" "screenshots" {
  for_each = local.screenshot_files

  bucket       = aws_s3_bucket.frontend.id
  key          = "screenshots/${each.value}"
  source       = "${path.module}/Screenshots/${each.value}"
  content_type = "image/png"
}

resource "aws_s3_object" "armageddon_link" {
  bucket       = aws_s3_bucket.frontend.id
  key          = "armageddon.md"
  source       = "${path.module}/armageddon.md"
  content_type = "text/markdown"
}