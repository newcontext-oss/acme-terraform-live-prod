module "db" {
  source = "git::ssh://git@github.com/newcontext/tf_module_gcloud_db.git"

  network_name   = "acme-corp"
  engineer_cidrs = "${var.engineer_cidrs}"

  ssh_public_key_filepath = "../ubuntu.pub"
}
