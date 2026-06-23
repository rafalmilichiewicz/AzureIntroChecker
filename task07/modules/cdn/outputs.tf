output "endpoint_hostname" {
  description = "Azure CDN Front Door Endpoint Hostname"
  value       = azurerm_cdn_frontdoor_endpoint.this.host_name
}
