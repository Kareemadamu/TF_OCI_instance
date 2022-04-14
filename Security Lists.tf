resource "oci_core_security_list" "Default_security_list" {
  #Required
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.server_vcn.id


  #Optional
  display_name = var.label_prefix == "none" ? "default-seclist" : "${var.label_prefix}-default-seclist"
  egress_security_rules {
    // allow all egress traffic
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  ingress_security_rules {
    // allow all SSH
    protocol = "6"
    source   = "0.0.0.0/0"
    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    // allow ICMP for all type 3 code 4
    protocol = "1"
    source   = "0.0.0.0/0"

    icmp_options {
      type = "3"
      code = "4"
    }
  }

  ingress_security_rules {
    //allow all ICMP from VCN
    protocol = "1"
    source   = var.vcn_cidr

    icmp_options {
      type = "3"
    }
  }
}


resource "oci_core_security_list" "Private-Subnet_security_list" {
  #Required
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.server_vcn.id


}