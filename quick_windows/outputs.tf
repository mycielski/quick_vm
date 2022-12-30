output "instance_public_ip" {
  value = module.vm.instance_public_ip
}

output "instance_dns" {
  value = module.vm.instance_dns
}

output "instance_password" {
  value     = module.vm.instance_password
  sensitive = true
}
