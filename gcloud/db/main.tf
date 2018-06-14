provider "google" {
  version = "~> 1.0"
}

data "terraform_remote_state" "network" {
  backend = "gcs"

  config {
    bucket = "acme-terraform-live-prod"
    prefix = "gcloud/network/terraform.tfstate"
  }
}

module "db" {
  source = "git::https://github.com/newcontext-oss/terraform-google-acme-db.git"

  engineer_cidrs          = "${var.engineer_cidrs}"
  name                    = "acme-corp"
  ssh_public_key_filepath = "../ubuntu.pub"
  subnetwork_name         = "${data.terraform_remote_state.network.db_subnetwork_name}"
}
