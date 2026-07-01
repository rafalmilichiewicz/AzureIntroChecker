output "load_balancer_ip" {
  description = "Load Balancer Public IP Address"
  value       = data.kubernetes_service.app_service.status[0].load_balancer[0].ingress[0].ip
}
