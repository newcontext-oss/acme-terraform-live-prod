# acme-terraform-live-prod

Terraform Live Repository for the Production environment

## Getting Started

Create a Google Cloud Platform project through the
[web console][gcp-web-console]. Make a note of the project ID.

Create a service account for the project through the [IAM][gcp-iam]
section of the web console.

The service account must have the following roles:

* Compute Instances Admin (v1)
* Compute Network Admin
* Compute Security Admin
* Storage Admin

Download the credentials of the service account as a JSON file and
place it in `gcloud/credentials.json`

Create an SSH key by running: `ssh-keygen -f gcloud/ubuntu`

Create an environment file located at `gcloud/.env` with the following
contents:

```sh
export TF_VAR_engineer_cidrs="[\"$(dig +short myip.opendns.com @resolver1.opendns.com)/32\"]"
export GOOGLE_APPLICATION_CREDENTIALS="../credentials.json"
export GCLOUD_PROJECT="<project-id>"
export GCLOUD_REGION="us-west1"
```

The environment file must be sourced before working with Terraform:

```sh
source gcloud/.env
```

### state_bucket

Creates the bucket that will hold the Terraform state.

```sh
cd gcloud/state_bucket
terraform init
terraform get -update
terraform apply
```

Change the content in the `state.tf` to a gcs backend:

```sh
terraform {
  backend "gcs" {
    bucket  = "acme-terraform-live-prod"
    prefix  = "gcloud/state_bucket/terraform.tfstate"
  }
}
```

Re-run `terraform init` and agree to the proposition of copying the
existing local state to the newly configured GCS backend.

### network

Creates a vpc network and subnetworks to deploy servers into.

```sh
cd ../network
terraform init
terraform get -update
terraform apply
```

### db

Creates a database server, which holds the data for the client.

```sh
cd ../db
terraform init
terraform get -update
terraform apply
```

### job

Creates a jobs server, which inputs data into the database.

```sh
cd ../job
terraform init
terraform get -update
terraform apply
```

### app

Creates an application server to present the data from the database.

```sh
cd ../app
terraform init
terraform get -update
terraform apply
```

[gcp-iam]: https://console.cloud.google.com/iam-admin/iam
[gcp-web-console]: https://console.cloud.google.com/
