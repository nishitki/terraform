resource "cloudstack_instance" "nishitki" {
  name             = "nishitki"
  display_name     = "nishitki"
  zone             = "tesla"
  service_offering = "light.S1"
  network          = "network1" 
  template         = "CentOS 7.1 64-bit"
  keypair          = "nishitki"
  expunge          = true
}

resource "cloudstack_nic" "nishitki" {
  network = "71000000889"
  virtual_machine = "${cloudstack_instance.nishitki.name}"
}

output "ip" {
  value = "${cloudstack_nic.nishitki.ipaddress}"
}

resource "cloudstack_disk" "disk01" {
  name          = "disk01"
  disk_offering = "Custom Disk"
  size          = 10
  attach        = true
  virtual_machine = "${cloudstack_instance.nishitki.id}"
  zone          = "${cloudstack_instance.nishitki.zone}"
}

resource "cloudstack_ssh_keypaier" "keypair" {
  name = "keypair"
  public_key = "./id_rsa"
}

