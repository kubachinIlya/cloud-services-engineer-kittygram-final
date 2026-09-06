terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "~> 0.90"
    }
  }
}

provider "yandex" {
  token      = var.token
  folder_id  = var.folder_id
  zone       = var.zone
}