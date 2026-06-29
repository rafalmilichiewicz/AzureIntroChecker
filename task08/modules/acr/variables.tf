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

variable "tags" {
  description = "Azure Container Registry Tags"
  type        = map(string)
}

variable "git_repository_url" {
  description = "git Repository URL"
  type        = string
}

variable "git_pat" {
  description = "Git PAT"
  type        = string
  sensitive   = true
}

variable "dockerfile_path" {
  description = "Path to the Dockerfile within the git repository"
  type        = string
}

variable "image_name" {
  description = "Name of the Docker image to build"
  type        = string
}

variable "image_tag" {
  description = "Tag of the Docker image to build"
  type        = string
}
