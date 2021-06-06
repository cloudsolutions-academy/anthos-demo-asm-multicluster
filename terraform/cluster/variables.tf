variable "project_id" {
  description = "The project ID to host the cluster in"
}

variable "gke_hub_sa_name" {
  description = "Name for the GKE Hub SA stored as a secret `creds-gcp` in the `gke-connect` namespace."
  type        = string
  default     = "gke-hub-sa"
}
