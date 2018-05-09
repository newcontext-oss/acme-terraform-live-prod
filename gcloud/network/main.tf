module "network" {
  source = "git::ssh://git@github.com/newcontext/tf_module_gcloud_network.git"

  network_name = "acme-corp"
}
