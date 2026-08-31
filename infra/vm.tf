resource "yandex_compute_instance" "kittygram_vm" {
  name        = "kittygram-vm"
  zone        = var.zone
  platform_id = "standard-v3"  # можно выбрать другой

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8vkc35bs6f7lr0e8m0"  # Ubuntu 24.04 LTS (уточните ID для вашего региона)
      size     = 30
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.kittygram_subnet.id
    security_group_ids = [yandex_vpc_security_group.kittygram_sg.id]
    nat                = true   # выдаёт публичный IP
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_public_key}"
    user-data = <<EOF
#cloud-config
package_update: true
packages:
  - apt-transport-https
  - ca-certificates
  - curl
  - software-properties-common

runcmd:
  - curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
  - add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  - apt-get update -y
  - apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
  - systemctl enable docker
  - systemctl start docker
  - usermod -aG docker ubuntu
EOF
  }
}

# Выводим публичный IP для удобства
output "vm_public_ip" {
  value = yandex_compute_instance.kittygram_vm.network_interface.0.nat_ip_address
}