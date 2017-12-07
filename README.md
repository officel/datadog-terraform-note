# Manage DataDog with Terraform

## Description

Manage [DataDog](https://www.datadoghq.com/) with [Terraform](https://www.terraform.io/).

## Require

* terraform
* DataDog account
* monitored target, e.g. AWS, GCP, Azure and more cloud Services

## environment variables

```sh
# https://app.datadoghq.com/account/settings#api

# API Keys : 
export DATADOG_API_KEY=

# Application Keys : 
export DATADOG_APP_KEY=
```

## How to

```sh
git clone git@github.com:officel/datadog-terraform-note.git

cd datadog-terraform-note/timeboard

terraform init

terraform plan

terraform apply -auto-approve

# https://app.datadoghq.com/dash/list
```

