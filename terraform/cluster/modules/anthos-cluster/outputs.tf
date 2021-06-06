output "service_account" {
  value       = module.anthos_cluster.service_account
  description = "Service account used to create the cluster and node pool(s)"
}

output "region" {
  value       = var.region
  description = "Region for development cluster"
}

output "zones" {
  value       = var.zones
  description = "Zones for development cluster"
}

output "cluster-name" {
  value       = var.name
  description = "Cluster Name"
}

output "endpoint" {
  value       = module.anthos_cluster.endpoint
  description = "Cluster endpoint used to identify the cluster"
}
