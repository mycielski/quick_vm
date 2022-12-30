output "instance_public_ip" {
  value = module.vm.instance_public_ip
}

output "instance_password" {
  value     = module.vm.instance_password
  sensitive = true
}
