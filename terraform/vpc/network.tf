provider "google" {
  version = "~> 3.44.0"
  project = var.project_id
}

resource "google_compute_network" "vpc-1" {
  name                    = "vpc-1"
  auto_create_subnetworks = false
  depends_on              = [module.project-services.project_id]
}

resource "google_compute_subnetwork" "subnet-1" {
  name          = "subnet-1"
  ip_cidr_range = "10.2.0.0/16"
  region        = "asia-southeast2"
  network       = google_compute_network.vpc-1.self_link

  secondary_ip_range {
    range_name    = "pods-ip-range-1"
    ip_cidr_range = "172.16.0.0/16"
  }
  secondary_ip_range {
    range_name    = "services-ip-range-1"
    ip_cidr_range = "192.168.2.0/24"
  }
}

resource "google_compute_subnetwork" "subnet-2" {
  name          = "subnet-2"
  ip_cidr_range = "10.3.0.0/16"
  region        = "asia-southeast1"
  network       = google_compute_network.vpc-1.self_link
  secondary_ip_range {
    range_name    = "pods-ip-range-2"
    ip_cidr_range = "172.17.0.0/16"
  }
  secondary_ip_range {
    range_name    = "services-ip-range-2"
    ip_cidr_range = "192.168.3.0/24"
  }
}
