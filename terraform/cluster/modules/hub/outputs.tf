output "wait" {
  description = "An output to use when you want to depend on cmd finishing"
  value       = module.gke_hub_registration.wait
}
