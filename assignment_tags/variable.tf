# General Information
variable "company" {
  description = "The company name"
  default     = "RAPIDD Academy"
}

variable "config_version" {
  description = "The version of the configuration"
  default     = "version-1.0.1"
}

# VPC Configuration
variable "vpc-name" {
  description = "The name of the VPC"
  default     = "dev-vpc"
}

variable "public-subnet-name" {
  description = "The name of the public subnet"
  default     = "pub-sub-1"
}

variable "private-subnet-name" {
  description = "The name of the private subnet"
  default     = "prv-sub-1"
}

variable "route-table-name" {
  description = "The name of the route table"
  default     = "dev-rt-1"
}

variable "internet-gateway-name" {
  description = "The name of the internet gateway"
  default     = "dev-igw-1"
}

# Tags
variable "tag-env" {
  description = "The environment tag"
  default     = "dev"
}

variable "tag-project" {
  description = "The project tag"
  default     = "smart-store"
}
