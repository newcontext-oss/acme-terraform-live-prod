output "external_ip" {
  value = "${module.app.external_ip}"
}

output "internal_ip" {
  value = "${module.app.internal_ip}"
}
