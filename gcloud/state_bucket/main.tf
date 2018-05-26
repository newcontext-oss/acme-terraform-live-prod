provider "google" {
  version = "~> 1.0"
}

module "state_bucket" {
  source = "git::ssh://git@github.com/newcontext/tf_module_gcloud_bucket.git"

  bucket_name = "tf-live-prod-state"
}
