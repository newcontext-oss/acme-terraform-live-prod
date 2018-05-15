# tf_live_prod

Terraform Live Repository for the Production environment

## Getting Started

Create a Google Cloud Platform project through the
[web console][gcp-web-console]. Make a note of the project ID.

Create a service account that can access that project, use this URL:
https://console.cloud.google.com/iam-admin/iam?project=<project id>

Download the credentials json file after creating the service account
and place it in `gcloud/credentials.json`

Create an ssh key by running: `ssh-keygen -f gcloud/ubuntu`

Create an environment file located at `gcloud/.env` with the following
contents:

```sh
export TF_VAR_engineer_cidrs="[\"$(dig +short myip.opendns.com @resolver1.opendns.com)/32\"]"
export GOOGLE_APPLICATION_CREDENTIALS="../credentials.json"
export GCLOUD_PROJECT="<project-id>
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
terraform plan
terraform apply
```

Change the content in the `state.tf` to a gcs backend:

```sh
terraform {
  backend "gcs" {
    bucket  = "tf-live-prod-state"
    prefix  = "gcloud/state_bucket/terraform.tfstate"
  }
}
```

Then re-run `terraform init` accept (yes) to switching the state backend to gcs

### network

Creates a vpc network and subnetworks to deploy servers into.

```sh
cd gcloud/network
terraform init
terraform get -update
terraform plan
terraform apply
```

### db

Creates a database server, which holds the data for the client.

```sh
cd gcloud/db
terraform init
terraform get -update
terraform plan
terraform apply
```

### job

Creates a jobs server, which inputs data into the database.

```sh
cd gcloud/job
terraform init
terraform get -update
terraform plan
terraform apply
```

### app

Creates an application server to present the data from the database.

```sh
cd gcloud/app
terraform init
terraform get -update
terraform plan
terraform apply
```

[gcp-web-console]: https://console.cloud.google.com/