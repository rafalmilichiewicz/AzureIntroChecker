output "redis_fqdn" {
  description = "Azure Container Instance Redis FQDN"
  value       = module.aci_redis.fqdn
}

output "aca_fqdn" {
  description = "Azure Container App FQDN"
  value       = module.aca.fqdn
}

output "aks_lb_ip" {
  description = "Load Balancer IP address of App in AKS."
  value       = module.k8s.load_balancer_ip
}
