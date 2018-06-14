terraform {
  backend "gcs" {
    bucket  = "acme-terraform-live-prod"
    prefix  = "gcloud/app/terraform.tfstate"
  }
}
