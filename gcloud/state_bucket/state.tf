terraform {
  backend "gcs" {
    bucket  = "tf-live-prod-state"
    prefix  = "gcloud/state_bucket/terraform.tfstate"
  }
}
