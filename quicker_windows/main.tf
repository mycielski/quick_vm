provider "aws" {
  region  = var.region
  profile = var.profile
}

resource "aws_default_vpc" "default" {
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [aws_default_vpc.default.id]
  }
}

module "vm" {
  source        = "./modules/vm"
  vpc_id        = aws_default_vpc.default.id
  subnet_id     = data.aws_subnets.default.ids[0]
  instance_type = var.instance_type
  elastic_ip    = var.elastic_ip
  tag_prefix    = var.tag_prefix
}
