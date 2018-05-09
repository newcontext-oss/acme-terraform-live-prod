terraform {
  backend "gcs" {
    bucket  = "tf-live-prod-state"
    prefix  = "gcloud/job/terraform.tfstate"
  }
}
