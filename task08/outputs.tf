output "aci_fqdn" {
  description = "Azure Container Instance FQDN"
  value       = module.aci.fqdn
}

output "aks_lb_ip" {
  description = "AKS Load Balancer IP Address"
  value       = data.kubernetes_service.app.status[0].load_balancer[0].ingress[0].ip
}
