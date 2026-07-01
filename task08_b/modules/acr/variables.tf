variable "name" {
  description = "Azure Container Registry Name"
  type        = string
}

variable "location" {
  description = "Azure Container Registry Region"
  type        = string
}

variable "resource_group_name" {
  description = "Azure Container Registry Resource Group Name"
  type        = string
}

variable "sku" {
  description = "Azure Container Registry SKU"
  type        = string
}

variable "image_name" {
  description = "Image Name"
  type        = string
}

variable "image_tag" {
  description = "Image Tag"
  type        = string
}

variable "blob_url" {
  description = "Blob URL of the application archive used as the build context"
  type        = string
}

variable "sas_token" {
  description = "SAS to Blobs"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags"
  type        = map(string)
}
