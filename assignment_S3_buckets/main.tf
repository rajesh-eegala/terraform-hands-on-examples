# Provider for the first region (us-east-1)
provider "aws" {
  alias  = "region1"
  region = element(var.regions, 0)
}

# Provider for the second region (ap-south-1)
provider "aws" {
  alias  = "region2"
  region = element(var.regions, 1)
}

# Provider for the third region (eu-west-1)
provider "aws" {
  alias  = "region3"
  region = element(var.regions, 2)
}

# Create S3 bucket in the first region
resource "aws_s3_bucket" "example1" {
  provider = aws.region1
  bucket   = var.s3_bucket_names[0]
}

# Create S3 bucket in the second region
resource "aws_s3_bucket" "example2" {
  provider = aws.region2
  bucket   = var.s3_bucket_names[1]
}

# Create S3 bucket in the third region
resource "aws_s3_bucket" "example3" {
  provider = aws.region3
  bucket   = var.s3_bucket_names[2]
}
