# TASK SPEC
# All variables should contain valid descriptions and type definitions 
# and be defined only at variables.tf

# From task parameters
variable "rg_name" {
  type        = string
  description = "Resource Group Name"
}

variable "vnet_name" {
  type        = string
  description = "Vnet Name"
}

variable "nic_name" {
  type        = string
  description = "Network Interface Name"
}

variable "nsg_name" {
  type        = string
  description = "Network Security Group Name"
}

variable "nsg_rule_http" {
  type        = string
  description = "NSG HTTP Rule Name"
}

variable "nsg_rule_ssh" {
  type        = string
  description = "NSG SSH Rule Name"
}

variable "public_ip" {
  type        = string
  description = "Public IP Name"
}

variable "domain_name_label" {
  type        = string
  description = "DNS name label for the Public IP"
}

variable "vm_name" {
  type        = string
  description = "VM Name"
}

variable "vm_os_version" {
  type        = string
  description = "VM OS Version"
}

variable "vm_SKU" {
  type        = string
  description = "VM SKU"
}

variable "vm_admin_username" {
  description = "Admin username for the Virtual Machine"
  type        = string
}

variable "vm_password" {
  description = "Admin Password for Virtual Machine"
  type        = string
  sensitive   = true
}


variable "location" {
  description = "Azure region of deployment"
  type        = string
}

variable "subnet_name" {
  type        = string
  description = "Subnet Name"
}

variable "vnet_address_space" {
  description = "List of address prefixes in CIDR format for VNet."
  type        = list(string)
}

variable "subnet_address_prefix" {
  description = "List of address prefixes in CIDR format for Subnet."
  type        = list(string)
}

variable "student_email" {
  type        = string
  description = "Student Email for Creator Tag"
}

variable "nic_ip_config_name" {
  type        = string
  description = "NIC IP Config name"

}