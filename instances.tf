resource "yandex_compute_instance" "public_vm" {
  name        = "public-vm"
  zone        = var.zone
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_2404.id
      size     = 10
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.public.id
    ip_address = "192.168.10.10"
    nat        = true
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(pathexpand(var.public_key_path))}"
  }
}

resource "yandex_compute_instance" "private_vm" {
  name        = "private-vm"
  zone        = var.zone
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_2404.id
      size     = 10
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.private.id
    ip_address = "192.168.20.10"
    nat        = false
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(pathexpand(var.public_key_path))}"
  }
}