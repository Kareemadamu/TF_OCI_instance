resource "oci_core_route_table" "default_route_table" {
  #Required
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.server_vcn.id

  #Optional

  display_name = var.label_prefix == "none" ? "internet-route" : "${var.label_prefix}-internet-route"

  route_rules {
    #Required
    network_entity_id = oci_core_internet_gateway.internet_gateway.id

    #Optional

    description      = "Terraformed - Auto-generated at Internet Gateway creation: Internet Gateway as default gateway"
    destination      = local.anywhere
    destination_type = "CIDR_BLOCK"

  }
}

resource "oci_core_route_table" "nat_route_table" {
  #Required
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.server_vcn.id

  #Optional

  display_name = var.label_prefix == "none" ? "nat-route" : "${var.label_prefix}-nat-route"

  route_rules {
    #Required
    network_entity_id = oci_core_nat_gateway.nat_gateway.id

    #Optional

    description      = "Terraformed - Auto-generated at Internet Gateway creation: Internet Gateway as default gateway"
    destination      = local.anywhere
    destination_type = "CIDR_BLOCK"
  }
}