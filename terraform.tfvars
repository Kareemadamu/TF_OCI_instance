#change if needed

provider_oci = {
  user_id              = "ocid1.user.oc1............." # change me
  api_fingerprint      = "<..>"                        # change me
  api_private_key_path = "<..>"                        # change me
  tenancy_id           = "ocid1.tenancy.oc1............."
  region               = "<..>" # change me if needed
  home_region          = "<..>"
}
compartment_id      = "ocid1.compartment.oc1.............."
linuximage          = "ocid1.image.oc1............" #change if needed
ssh_public_key_path = "<..>"
label_prefix        = "git"
linux_shape = {
  shape            = "VM.Standard.A1.Flex",
  ocpus            = 1,
  memory           = 4,
  boot_volume_size = 50
}
app_server_operating_system_version = "7.9"
linux_image_id                      = "Oracle"
internet_gateway_enabled            = true
nat_gateway_block_traffic           = false
vcn_cidr                            = "10.0.0.0/16"
publicsub_cidr_block                = "10.0.0.0/24"
privatesub_cidr_block               = "10.0.1.0/24"
agree                               = "true"
disagree                            = "false"
