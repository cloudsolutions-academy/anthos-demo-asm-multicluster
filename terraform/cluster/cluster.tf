provider "google" {
  project = var.project_id
  version = "~> 3.44.0"
}

provider "google-beta" {
  project = var.project_id
  version = "~> 3.44.0"
}

data "google_compute_network" "vpc-1" {
  name = "vpc-1"
}

data "google_compute_subnetwork" "subnet-1" {
  name   = "subnet-1"
  region = "asia-southeast2"
}

data "google_compute_subnetwork" "subnet-2" {
  name   = "subnet-2"
  region = "asia-southeast1"
}

module "anthos-cluster-1" {
  source            = "./modules/anthos-cluster"
  project_id        = var.project_id
  name              = "anthos-cluster-1"
  region            = "asia-southeast2"
  zones             = ["asia-southeast2-a"]
  network           = data.google_compute_network.vpc-1.name
  subnetwork        = data.google_compute_subnetwork.subnet-1.name
  ip_range_pods     = "pods-ip-range-1"
  ip_range_services = "services-ip-range-1"
  release_channel   = "STABLE"
}

module "anthos-cluster-2" {
  source            = "./modules/anthos-cluster"
  project_id        = var.project_id
  name              = "anthos-cluster-2"
  region            = "asia-southeast1"
  zones             = ["asia-southeast1-a"]
  network           = data.google_compute_network.vpc-1.name
  subnetwork        = data.google_compute_subnetwork.subnet-2.name
  ip_range_pods     = "pods-ip-range-2"
  ip_range_services = "services-ip-range-2"
  release_channel   = "STABLE"
}

resource "google_service_account" "gke_hub_sa" {
  project      = var.project_id
  account_id   = var.gke_hub_sa_name
}

resource "google_project_iam_member" "gke_hub_member" {
  project = var.project_id
  role    = "roles/gkehub.connect"
  member  = "serviceAccount:${google_service_account.gke_hub_sa.email}"
}

module "anthos-hub-cluster-1" {
  source            = "./modules/hub"
  project_id        = var.project_id
  gke_hub_sa        = google_service_account.gke_hub_sa.name
  cluster_name      = module.anthos-cluster-1.cluster-name
  cluster_endpoint  = module.anthos-cluster-1.endpoint
  location          = module.anthos-cluster-1.zones[0]
}

module "anthos-hub-cluster-2" {
  source            = "./modules/hub"
  project_id        = var.project_id
  gke_hub_sa        = google_service_account.gke_hub_sa.name
  cluster_name      = module.anthos-cluster-2.cluster-name
  cluster_endpoint  = module.anthos-cluster-2.endpoint
  location          = module.anthos-cluster-2.zones[0]
}

module "anthos-asm-cluster-1" {
  source           = "terraform-google-modules/kubernetes-engine/google//modules/asm"

  project_id       = var.project_id
  cluster_name      = module.anthos-cluster-1.cluster-name
  location          = module.anthos-cluster-1.zones[0]
  cluster_endpoint  = module.anthos-cluster-1.endpoint
}

module "anthos-asm-cluster-2" {
  source           = "terraform-google-modules/kubernetes-engine/google//modules/asm"

  project_id       = var.project_id
  cluster_name      = module.anthos-cluster-2.cluster-name
  location          = module.anthos-cluster-2.zones[0]
  cluster_endpoint  = module.anthos-cluster-2.endpoint
}

