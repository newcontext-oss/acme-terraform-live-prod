provider "google" {
  version = "~> 1.0"
}

module "network" {
  source = "git::https://github.com/newcontext-oss/terraform-google-acme-network.git"

  organization_name = "acme-corp"
}
