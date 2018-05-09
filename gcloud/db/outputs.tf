output "external_ip" {
  value = "${module.db.external_ip}"
} 

output "internal_ip" {
  value = "${module.db.internal_ip}"
} 
