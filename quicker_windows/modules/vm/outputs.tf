output "instance_public_ip" {
  value = data.aws_eip.eip.public_ip
}

output "instance_password" {
  value = rsadecrypt(aws_instance.default.password_data, tls_private_key.key.private_key_pem)
}
