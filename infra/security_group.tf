resource "yandex_vpc_security_group" "kittygram_sg" {
  name        = "kittygram-sg"
  network_id  = yandex_vpc_network.kittygram_network.id

  ingress {
    protocol       = "TCP"
    description    = "SSH"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }

  ingress {
    protocol       = "TCP"
    description    = "Gateway"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 9000
  }

  egress {
    protocol       = "ANY"
    description    = "All outbound"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}