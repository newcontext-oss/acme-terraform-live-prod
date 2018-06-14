terraform {
  backend "gcs" {
    bucket  = "acme-terraform-live-prod"
    prefix  = "gcloud/network/terraform.tfstate"
  }
}
