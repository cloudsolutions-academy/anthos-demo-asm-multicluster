output "anthos-cluster-1-sa" {
  value       = module.anthos-cluster-1.service_account
  description = "Service account used to create the cluster and node pool(s)"
}

output "anthos-cluster-2-sa" {
  value       = module.anthos-cluster-2.service_account
  description = "Service account used to create the cluster and node pool(s)"
}

