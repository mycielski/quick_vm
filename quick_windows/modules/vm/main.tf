resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key" {
  key_name   = "terraform-key"
  public_key = tls_private_key.key.public_key_openssh
}

resource "aws_security_group" "default" {
  name        = "terraform-sg"
  description = "Allow SSH from anywhere and all outbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "RDP"
    to_port     = 3389
    from_port   = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_ami" "default" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base*"]
  }
}

resource "aws_instance" "default" {
  ami                         = data.aws_ami.default.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.key.key_name
  associate_public_ip_address = true
  get_password_data           = true
  vpc_security_group_ids = [
    aws_security_group.default.id
  ]
  subnet_id = var.subnet_id
  root_block_device {
    volume_size = var.disk_size
  }
  tags = {
    Name = "terraform-instance"
  }
}
