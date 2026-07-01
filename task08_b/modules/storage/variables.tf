variable "name" {
  description = "Storage Account Name"
  type        = string
}

variable "location" {
  description = "Storage Account Region"
  type        = string
}

variable "resource_group_name" {
  description = "Storage Account Resource Group Name"
  type        = string
}

variable "account_replication_type" {
  description = "Storage Account Replication Type"
  type        = string
}

variable "container_name" {
  description = "Storage Account Blob Container Name"
  type        = string
}

variable "container_access_type" {
  description = "Storage Account Blob Container Access Level"
  type        = string
}

variable "source_dir" {
  description = "Path to the application source directory that will be archived and uploaded as a blob"
  type        = string
}

variable "sas_validity_hours" {
  description = "SAS Token Valid Number of Hours"
  type        = number
}

variable "tags" {
  description = "Tags"
  type        = map(string)
}


