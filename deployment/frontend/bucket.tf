# Create a new AWS S3 bucket
resource "aws_s3_bucket" "frontend_bucket" {
  # This name have to be unique
  bucket = var.FRONTEND_BUCKET_NAME
  tags = {
    Name        = var.FRONTEND_BUCKET_NAME
    Environment = var.ENV
  }
}

# Configure S3 bucket to host a Static Website
resource "aws_s3_bucket_website_configuration" "frontend_bucket_website_configuration" {
  bucket = aws_s3_bucket.frontend_bucket.id

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "index.html"
  }
}

# Configure settings and permissions
resource "aws_s3_bucket_ownership_controls" "frontend_bucket_ownership_controls" {
  bucket = aws_s3_bucket.frontend_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_public_access_block" "frontend_bucket_public_access_block" {
  bucket                  = aws_s3_bucket.frontend_bucket.id
  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_acl" "frontend_bucket_acl" {
  bucket = aws_s3_bucket.frontend_bucket.id
  acl    = "public-read"

  # Requiered unless you'll face the following error:
  # Error: error creating S3 bucket ACL for bucketname-for-frontend-bucket: AccessDenied: Access Denied
  # Error: Error putting S3 policy: AccessDenied: Access Denied
  depends_on = [
    aws_s3_bucket_ownership_controls.frontend_bucket_ownership_controls, aws_s3_bucket_public_access_block.frontend_bucket_public_access_block
  ]
}
resource "aws_s3_bucket_policy" "frontend_bucket_policy" {
  bucket = aws_s3_bucket.frontend_bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}
data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    sid    = "PublicReadGetObject"
    effect = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions = [
      "s3:GetObject"
    ]
    resources = [
      aws_s3_bucket.frontend_bucket.arn,
      "${aws_s3_bucket.frontend_bucket.arn}/*",
    ]
  }
}
