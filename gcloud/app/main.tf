provider "google" {
  version = "~> 1.0"
}

data "terraform_remote_state" "network" {
  backend = "gcs"

  config {
    bucket = "tf-live-prod-state"
    prefix = "gcloud/network/terraform.tfstate"
  }
}

data "terraform_remote_state" "db" {
  backend = "gcs"

  config {
    bucket = "tf-live-prod-state"
    prefix = "gcloud/db/terraform.tfstate"
  }
}

module "app" {
  source = "git::ssh://git@github.com/newcontext/tf_module_gcloud_app.git"

  db_internal_ip          = "${data.terraform_remote_state.db.internal_ip}"
  name                    = "acme-corp"
  engineer_cidrs          = "${var.engineer_cidrs}"
  ssh_public_key_filepath = "../ubuntu.pub"
  subnetwork_name         = "${data.terraform_remote_state.network.app_subnetwork_name}"
}
