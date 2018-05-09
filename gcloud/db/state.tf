terraform {
  backend "gcs" {
    bucket  = "tf-live-prod-state"
    prefix  = "gcloud/db/terraform.tfstate"
  }
}
