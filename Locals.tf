locals {
  all_protocols    = "all"
  anywhere         = "0.0.0.0/0"
  ssh_port         = 22
  tcp_protocol     = 6
  bastion_image_id = var.linux_image_id == "Autonomous" ? data.oci_core_images.autonomous_images.images.0.id : var.linux_image_id
  vcn_cidr         = var.vcn_cidr
}

data "oci_core_images" "autonomous_images" {
  compartment_id           = var.compartment_id
  operating_system         = "Oracle Autonomous Linux"
  operating_system_version = var.app_server_operating_system_version
  shape                    = lookup(var.linux_shape, "shape", "VM.Standard.A1.Flex")
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}