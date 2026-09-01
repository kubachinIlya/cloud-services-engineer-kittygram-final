terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "~> 0.90"
    }
  }
}

provider "yandex" {
  access_key = var.access_key
  secret_key = var.secret_key
  folder_id  = var.folder_id
  zone       = var.zone
}