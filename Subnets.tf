resource "oci_core_subnet" "private_subnet" {
  #Required
  cidr_block     = var.privatesub_cidr_block
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.server_vcn.id

  #Optional



  display_name               = var.label_prefix == "none" ? "privsub" : "${var.label_prefix}-privsub"
  dns_label                  = "Privsub"
  prohibit_public_ip_on_vnic = var.agree
  prohibit_internet_ingress  = var.agree
  security_list_ids = [
    oci_core_security_list.Private-Subnet_security_list.id
  ]
}

resource "oci_core_subnet" "public_subnet" {
  #Required
  cidr_block     = var.publicsub_cidr_block
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.server_vcn.id

  #Optional
  display_name               = var.label_prefix == "none" ? "pubsub" : "${var.label_prefix}-pubsub"
  dns_label                  = "pubsub"
  prohibit_internet_ingress  = var.disagree
  prohibit_public_ip_on_vnic = var.disagree
  route_table_id             = oci_core_route_table.default_route_table.id
  security_list_ids = [
    oci_core_security_list.Default_security_list.id
  ]
}