terraform {
  backend "gcs" {
    bucket = "sandbox-312412-anthos-tf"
    prefix = "vpc"
  }
}
