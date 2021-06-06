module "project-services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 9.0"

  project_id = var.project_id

  # Don't disable the services
  disable_services_on_destroy = false
  disable_dependent_services  = false

  activate_apis = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "sqladmin.googleapis.com",
    "artifactregistry.googleapis.com",
    "gkehub.googleapis.com",
    "multiclusteringress.googleapis.com",
    "meshca.googleapis.com",
    "stackdriver.googleapis.com",
    "meshconfig.googleapis.com",
    "meshtelemetry.googleapis.com",
    "multiclusterservicediscovery.googleapis.com",
    "anthos.googleapis.com"
  ]
}
