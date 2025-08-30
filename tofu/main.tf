terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}
provider "virtualbox" {}

resource "virtualbox_vm" "minikube" {
  name   = "minikube"
  image = "/mnt/c/Users/aakas/Downloads.vdi"

  cpus   = 2
  memory = 4096

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet0"
  }

  network_adapter {
    type = "nat"
  }

}

output "minikube_vm_ip" {
  value = virtualbox_vm.minikube.network_adapter[0].ipv4_address
}