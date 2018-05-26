output "app_subnetwork_name" {
  description = "The name of the application subnetwork."
  value       = "${module.network.app_subnetwork_name}"
}

output "db_subnetwork_name" {
  description = "The name of the database subnetwork."
  value       = "${module.network.database_subnetwork_name}"
}

output "job_subnetwork_name" {
  description = "The name of the job subnetwork."
  value       = "${module.network.job_subnetwork_name}"
}
