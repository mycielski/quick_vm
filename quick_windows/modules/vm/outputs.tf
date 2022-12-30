output "instance_public_ip" {
  value = aws_instance.default.public_ip
}

output "instance_dns" {
  value = aws_instance.default.public_dns
}

output "instance_password" {
  value = rsadecrypt(aws_instance.default.password_data, tls_private_key.key.private_key_pem)
}
