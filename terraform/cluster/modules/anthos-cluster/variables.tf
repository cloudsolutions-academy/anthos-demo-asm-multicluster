variable "project_id" {
  description = "Project ID where the cluster will run"
}

variable "name" {
  description = "A unique name for the resource"
}

variable "region" {
  description = "The name of the region to run the cluster"
}

variable "zones" {
  description = "The name of the zones to run the cluster"
}

variable "network" {
  description = "The name of the network to run the cluster"
}

variable "subnetwork" {
  description = "The name of the subnet to run the cluster"
}

variable "ip_range_pods" {
  description = "The secondary range for the pods"
}

variable "ip_range_services" {
  description = "The secondary range for the services"
}

variable "machine_type" {
  description = "Type of node to use to run the cluster"
  default     = "n1-standard-2"
}

variable "minimum_node_pool_instances" {
  type        = number
  description = "Number of node-pool instances to have active"
  default     = 1
}

variable "maximum_node_pool_instances" {
  type        = number
  description = "Maximum number of node-pool instances to scale to"
  default     = 3
}

variable "release_channel" {
  type        = string
  description = "(Beta) The release channel of this cluster. Accepted values are `UNSPECIFIED`, `RAPID`, `REGULAR` and `STABLE`. Defaults to `UNSPECIFIED`."
  default     = "STABLE"
}

