terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "~> 0.90"
    }
  }
}

provider "yandex" { 
  folder_id  = var.folder_id
  zone       = var.zone
}
