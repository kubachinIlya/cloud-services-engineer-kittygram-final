variable "access_key" {
  description = "Yandex Cloud Static Access Key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "Yandex Cloud Static Secret Key"
  type        = string
  sensitive   = true
}

variable "folder_id" {
  description = "Yandex Cloud folder ID"
  type        = string
}

variable "zone" {
  description = "Yandex Cloud zone"
  type        = string
  default     = "ru-central1-a"
}

variable "ssh_public_key" {
  description = "Public SSH key for VM access"
  type        = string
}