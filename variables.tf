provider "oci" {
  region           = var.region
  tenancy_ocid     = var.tenancy_id
  user_ocid        = var.user_id
  fingerprint      = var.api_fingerprint
  private_key_path = var.api_private_key_path
}

terraform {
  required_providers {
    oci = {
      source = "hashicorp/oci"
    }
  }
  required_version = ">= 0.13"
}

variable "api_fingerprint" {
  description = "Fingerprint of oci api private key."
  type        = string
  default     = ""
}

variable "provider_oci" {
  type = map(string)
}


variable "api_private_key_path" {
  description = "The path to oci api private key."
  type        = string
  default     = ""
}

variable "region" {
  # List of regions: https://docs.cloud.oracle.com/iaas/Content/General/Concepts/regions.htm#ServiceAvailabilityAcrossRegions
  description = "The oci region where resources will be created."
  type        = string
  default     = ""
}

variable "home_region" {
  # List of regions: https://docs.cloud.oracle.com/iaas/Content/General/Concepts/regions.htm#ServiceAvailabilityAcrossRegions
  description = "The oci Home region where IAM resources will be created."
  type        = string
  default     = "us-phoenix-1"
}

variable "tenancy_id" {
  description = "The tenancy id in which to create the resources."
  type        = string
  default     = ""
}

variable "user_id" {
  description = "The id of the user that terraform will use to create the resources."
  type        = string
  default     = ""
}

variable "instance_availability_domain" {
  description = "availability Domain."
  type        = string
  default     = "GqIF:PHX-AD-1"
}

# general oci parameters
variable "compartment_id" {
  description = "The compartment id where to create all resources."
  type        = string
  default     = ""
}

variable "agree" {
  description = "accept"
  type        = bool
}

variable "disagree" {
  description = "deny"
  type        = bool
}


variable "ssh_public_key_path" {
  default     = "none"
  description = "The path to ssh public key."
  type        = string
}
variable "ssh_public_key" {
  default     = ""
  description = "The ssh public key."
  type        = string
}

variable "linux_shape" {
  default = {
    # shape = "VM.Standard.A1.Flex"
    shape            = "VM.Standard.A1.Flex",
    ocpus            = 1,
    memory           = 6,
    boot_volume_size = 50
  }
  description = "The shape of linux instance."
  type        = map(any)
}
variable "export_app-server_source_image_id" {
  default = "ocid1.image.oc1.phx.aaaaaaaa2szgivkdhq3vshh2xg4orjqrtjcrbzkaacvhxsnswnwjvnlj2ulq"
}

variable "linux_image_id" {
  default = "ocid1.image.oc1.phx.aaaaaaaa2szgivkdhq3vshh2xg4orjqrtjcrbzkaacvhxsnswnwjvnlj2ulq"
}

variable "linuximage" {
  default     = "Oracle"
  description = "The image id to use for linux server. Set either an image id or to Oracle. If value is set to Oracle, the default Oracle Linux platform image will be used."
  type        = string
}

variable "label_prefix" {
  default     = "Oracle"
  description = "A string that will be prepended to all resources."
  type        = string
}

variable "vcn_dns_label" {
  default     = "GitVcn"
  description = "default dns label."
  type        = string
}

variable "internet_gateway_enabled" {
  description = "whether to create a int gateway"
  default     = true
  type        = bool
}

variable "nat_gateway_block_traffic" {
  description = "whether to create a int gateway"
  default     = false
  type        = bool
}

variable "privatesub_cidr_block" {
  default     = "10.0.1.0/24"
  description = "The cidr block of private subnet."
  type        = string
}

variable "publicsub_cidr_block" {
  default     = "10.0.0.0/24"
  description = "The cidr block of public subnet."
  type        = string
}

variable "vcn_cidr" {
  default     = "10.0.0.0/16"
  description = "The cidr block of VCN."
  type        = string
}
variable "vcn_name" {
  default     = "VCN"
  description = "name of vcn"
  type        = string
}

variable "app_server_operating_system_version" {
  description = "In case Autonomous Linux is used, allow specification of Autonomous version"
  default     = "7.9"
  type        = string
}

output "App_server_public_ip" {
  value = oci_core_instance.app_server.public_ip
}