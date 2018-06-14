terraform {
  backend "gcs" {
    bucket  = "acme-terraform-live-prod"
    prefix  = "gcloud/db/terraform.tfstate"
  }
}
