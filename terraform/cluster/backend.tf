terraform {
  backend "gcs" {
    bucket = "[PROJECT-ID]-anthos-tf"
    prefix = "cluster"
  }
}
