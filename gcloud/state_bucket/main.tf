provider "google" {
  version = "~> 1.0"
}

module "state_bucket" {
  source = "git::https://github.com/newcontext-oss/terraform-google-acme-bucket.git"

  bucket_name = "acme-terraform-live-prod"
}
