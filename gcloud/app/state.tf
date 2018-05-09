terraform {
  backend "gcs" {
    bucket  = "tf-live-prod-state"
    prefix  = "gcloud/app/terraform.tfstate"
  }
}
