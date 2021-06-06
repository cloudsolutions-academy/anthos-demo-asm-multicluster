locals {
  gke_hub_sa_key = google_service_account_key.gke_hub_key.private_key
}

resource "google_service_account_key" "gke_hub_key" {
  service_account_id = var.gke_hub_sa
}

module "gke_hub_registration" {
  source  = "terraform-google-modules/gcloud/google"
  version = "~> 2.0"
  
  platform           = "linux"
  upgrade            = true
  module_depends_on  = [var.cluster_endpoint]

  create_cmd_entrypoint  = "${path.module}/scripts/hub_registration.sh"
  create_cmd_body        = "${var.location} ${var.cluster_name} ${local.gke_hub_sa_key}"
  destroy_cmd_entrypoint = "gcloud"
  destroy_cmd_body       = "container hub memberships unregister ${var.cluster_name} --gke-cluster=${var.location}/${var.cluster_name} --project ${var.project_id}"
}
