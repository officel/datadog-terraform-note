# About provider datadog

## clean

環境変数を使えば何も書かなくて大丈夫

```sh
export DATADOG_API_KEY=
export DATADOG_APP_KEY=
env | grep DATADOG
```

provider 自体は必要


```datadog.tf
provider "datadog" {
}
```

個人的には一番シンプルでいい気がする


## public document

https://www.terraform.io/docs/providers/datadog/index.html

ドキュメントに従うならvariableを指定して、オプションで渡す

```variables.tf
variable "datadog_api_key" {}
variable "datadog_app_key" {}
```

```datadog.tf
provider "datadog" {
  api_key = "${var.datadog_api_key}"
  app_key = "${var.datadog_app_key}"
}
```

```sh
# 実行時に指定（何も指定しなければ対話型で入力できる）

terraform plan


# コマンドラインの引数で指定

terraform plan -var 'datadog_api_key=*****' -var 'datadog_app_key=*****'


# 環境変数で指定（terraformのお作法に則る）

export TF_VAR_datadog_api_key=
export TF_VAR_datadog_app_key=

terraform plan


# terraform.tfvars で指定

api_keyもapp_keyもクレデンシャルなのであまり薦められない
もちろんdatadog.tfに直接記載するのも薦めない

```

