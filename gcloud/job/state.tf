terraform {
  backend "gcs" {
    bucket  = "acme-terraform-live-prod"
    prefix  = "gcloud/job/terraform.tfstate"
  }
}
