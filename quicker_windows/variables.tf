variable "profile" {
  type        = string
  description = "The profile to use for AWS CLI commands"
}

variable "region" {
  type        = string
  description = "The region to use for AWS CLI commands"
}

variable "instance_type" {
  type        = string
  description = "The type of the instance"
}

variable "vpc_ipv4_address" {
  type        = string
  description = "The IPv4 address of the VPC"
  default     = "192.168.0.0"
}

variable "vpc_ipv4_mask" {
  type        = number
  description = "The IPv4 mask of the VPC"
  default     = 16
}

variable "elastic_ip" {
  type        = string
  description = "The elastic IP association to assign to the instance"
}

variable "tag_prefix" {
  type        = string
  description = "The prefix to use for tagging resources"
  default     = ""
}
