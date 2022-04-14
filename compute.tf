resource "oci_core_instance" "app_server" {
  #Required
  availability_domain = var.instance_availability_domain
  compartment_id      = var.compartment_id
  shape               = lookup(var.linux_shape, "shape", "VM.Standard.A1.Flex")
  metadata = {
    ssh_authorized_keys = var.ssh_public_key != "" ? var.ssh_public_key : file(var.ssh_public_key_path)
  }

  #Optional
  display_name = var.label_prefix == "none" ? "app-server" : "${var.label_prefix}-app-server"
  agent_config {

    are_all_plugins_disabled = "false"
    is_management_disabled   = "false"
    is_monitoring_disabled   = "false"
    plugins_config {
      desired_state = "DISABLED"
      name          = "Vulnerability Scanning"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Oracle Java Management Service"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "OS Management Service Agent"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Compute Instance Run Command"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Compute Instance Monitoring"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Block Volume Management"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Bastion"
    }

  }
  availability_config {

    recovery_action = "RESTORE_INSTANCE"
  }
  shape_config {
    baseline_ocpu_utilization = ""
    memory_in_gbs             = "6"
    ocpus                     = "1"
  }
  create_vnic_details {

    #Optional
    assign_public_ip = var.agree
    display_name     = var.label_prefix == "none" ? "app-server-vnic" : "${var.label_prefix}-app-server-vnic"

    hostname_label = "app-server"

    subnet_id = oci_core_subnet.public_subnet.id
  }

  launch_options {
    boot_volume_type                    = "PARAVIRTUALIZED"
    firmware                            = "UEFI_64"
    is_consistent_volume_naming_enabled = "true"
    is_pv_encryption_in_transit_enabled = "true"
    network_type                        = "PARAVIRTUALIZED"
    remote_data_volume_type             = "PARAVIRTUALIZED"
  }




  source_details {
    #Required
    source_id   = var.linuximage
    source_type = "image"

  }

}
