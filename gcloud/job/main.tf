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

data "terraform_remote_state" "db" {
  backend = "gcs"

  config {
    bucket = "acme-terraform-live-prod"
    prefix = "gcloud/db/terraform.tfstate"
  }
}

module "job" {
  source = "git::https://github.com/newcontext-oss/terraform-google-acme-job.git"

  db_internal_ip          = "${data.terraform_remote_state.db.internal_ip}"
  engineer_cidrs          = "${var.engineer_cidrs}"
  name                    = "acme-corp"
  ssh_public_key_filepath = "../ubuntu.pub"
  subnetwork_name         = "${data.terraform_remote_state.network.job_subnetwork_name}"
}
