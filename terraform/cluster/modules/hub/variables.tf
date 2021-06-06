variable "cluster_name" {
  description = "The unique name to identify the cluster in ASM."
  type        = string
}

variable "cluster_endpoint" {
  description = "The GKE cluster endpoint."
  type        = string
}

variable "project_id" {
  description = "The project in which the resource belongs."
  type        = string
}

variable "location" {
  description = "The location (zone or region) this cluster has been created in."
  type        = string
}

variable "gke_hub_membership_name" {
  description = "Memebership name that uniquely represents the cluster being registered on the Hub"
  type        = string
  default     = "gke-asm-membership"
}

variable "internal_ip" {
  description = "Use internal ip for the cluster endpoint."
  type        = bool
  default     = false
}

variable "gke_hub_sa" {
  description = "GKE Hub service account"
  type        = string
}
