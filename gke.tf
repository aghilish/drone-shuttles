terraform {
  required_version = ">=0.13"
  backend "gcs" {}
}

data "google_client_config" "default" {}


module "gke-primary" {
  source                 = "./modules/gke-cluster"
  project_id                = var.project_id
  name                   = var.cluster_name_primary
  region                 = var.region_primary
  zones                  = var.zones_primary
  network                = var.network
  subnet                 = var.subnet_primary
  master_authorized_networks_block = "0.0.0.0/0"
  operator_path          = var.operator_path

}

module "gke-secondary" {
  source                 = "./modules/gke-cluster"
  project_id                = var.project_id
  name                   = var.cluster_name_secondary
  region                 = var.region_secondary
  zones                  = var.zones_secondary
  network                = var.network
  subnet                 = var.subnet_secondary
  master_authorized_networks_block = "0.0.0.0/0"
  operator_path          = var.operator_path
}