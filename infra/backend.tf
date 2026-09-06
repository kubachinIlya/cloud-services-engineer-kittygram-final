terraform {
  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "iliakubashin-kittygram-tfstate"
    region = "us-east-1"
    key    = "tf-state.tfstate"

    # Эти параметры необходимы для не-AWS S3
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
  }
}