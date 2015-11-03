resource "cloudstack_instance" "vm01" {
  name             = "vm01"
  display_name     = "vm01"
  zone             = "tesla"
  service_offering = "light.S1"
  network          = "network1"
  template         = "CentOS 7.1 64-bit"
  expunge          = true
}

resource "cloudstack_disk" "disk01" {
  name 		= "disk01"
  disk_offering = "Custom Disk"
  size		= 10
  attach 	= true
  virtual_machine = "${cloudstack_instance.vm01.id}"
  zone		= "${cloudstack_instance.vm01.zone}"
}

