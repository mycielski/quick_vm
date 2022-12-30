variable "key_filename" {
  type        = string
  description = "The name of the key file"
  default     = "secret.pem"
}

variable "instance_type" {
  type        = string
  description = "The type of the instance"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC to deploy the instance in"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet to deploy the instance in"
}

variable "disk_size" {
  type        = number
  description = "The size of the disk in GB"
  default     = 200
}