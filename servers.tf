resource "upcloud_server" "example" {
  hostname = "terraform.cloud"
  zone     = var.upcloud_region
  plan     = "1xCPU-2GB"

  template {
    storage = "Ubuntu Server 24.04 LTS (Noble Numbat)"
    size    = 25

    backup_rule {
      interval  = "daily"
      time      = "0100"
      retention = 8
    }
  }

  network_interface {
    type = "public"
  }

  labels = {
    env        = "dev"
    production = "false"
  }

  login {
    user = "antonio"

    keys = [ var.ssh_key_ajiniesta ]
  }
}
