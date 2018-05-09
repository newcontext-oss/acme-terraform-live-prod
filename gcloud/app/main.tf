data "terraform_remote_state" "db" {
  backend = "local"
  config {  
    bucket  = "tf-live-prod-state"
    prefix  = "gcloud/db/terraform.tfstate"
  }
}

module "app" {
  source = "git::ssh://git@github.com/newcontext/tf_module_gcloud_app.git"

  db_internal_ip = "${data.terraform_remote_state.db.internal_ip}"

  network_name   = "acme-corp"
  engineer_cidrs = "${var.engineer_cidrs}"

  ssh_public_key_filepath = "../ubuntu.pub"
}
