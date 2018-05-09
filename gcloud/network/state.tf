terraform {
  backend "gcs" {
    bucket  = "tf-live-prod-state"
    prefix  = "gcloud/network/terraform.tfstate"
  }
}
