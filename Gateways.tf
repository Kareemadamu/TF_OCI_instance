resource "oci_core_internet_gateway" "internet_gateway" {
  #Required
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.server_vcn.id
  #Optional
  enabled      = var.internet_gateway_enabled
  display_name = var.label_prefix == "none" ? "internet-gateway" : "${var.label_prefix}-internet-gateway"
}
resource "oci_core_nat_gateway" "nat_gateway" {
  #Required
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.server_vcn.id

  #Optional
  block_traffic = var.nat_gateway_block_traffic

  display_name = var.label_prefix == "none" ? "nat-gateway" : "${var.label_prefix}-nat-gateway"


}