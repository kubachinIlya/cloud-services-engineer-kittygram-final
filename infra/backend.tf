terraform {
  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "iliakubashin-kittygram-tfstate"
    region = "ru-central1"
    key    = "tf-state.tfstate"
  }
}