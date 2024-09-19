# Input variable to list the regions

variable "regions" {
  type    = list(string)
  default = ["us-east-1", "ap-south-1", "eu-west-1"]
}


variable "s3_bucket_names" {
  description = "Provide the list of buckets to be created"
  type = list(string)
  default = ["phoenix-proj-551","phoenix-proj-564","phoenix-proj-572"]
}