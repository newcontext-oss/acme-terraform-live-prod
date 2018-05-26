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

module "db" {
  source = "git::ssh://git@github.com/newcontext/tf_module_gcloud_db.git"

  engineer_cidrs          = "${var.engineer_cidrs}"
  name                    = "acme-corp"
  ssh_public_key_filepath = "../ubuntu.pub"
  subnetwork_name         = "${data.terraform_remote_state.network.db_subnetwork_name}"
}
