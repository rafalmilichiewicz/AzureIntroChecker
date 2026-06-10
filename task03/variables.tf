# TASK SPEC
# All variables should contain valid descriptions and type definitions 
# and be defined only at variables.tf

# From task parameters
variable "rg_name" {
  type        = string
  description = "Resource Group Name"
}

variable "storageaccount_name" {
  type        = string
  description = "Storage Account Name"
}

variable "vnet_name" {
  type        = string
  description = "Vnet Name"
}

variable "subnet1_name" {
  type        = string
  description = "Subnet 1 Name"
}

variable "subnet2_name" {
  type        = string
  description = "Subnet 2 Name"
}

variable "student_email" {
  type        = string
  description = "Student Email for Creator Tag"
}

# Other "required"
variable "location" {
  description = "Azure region of deployment"
  type        = string
}

variable "storageaccount_tier" {
  description = "Storage Account Tier"
  type        = string
}

variable "storageaccount_replication_type" {
  description = "Storage Account Replication Type"
  type = string
}

variable "vnet_address_space" {
  description = "List of address prefixes in CIDR format."
  type        = list(string)
}

variable "subnet1_address_prefix" {
  description = "List of address prefixes in CIDR format."
  type        = list(string)
}

variable "subnet2_address_prefix" {
  description = "List of address prefixes in CIDR format."
  type        = list(string)
}
