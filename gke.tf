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
  master_ipv4_cidr_block = "10.0.0.0/28"
  master_authorized_networks_block = "0.0.0.0/0"
  master_authorized_networks_block2 = "0.0.0.0/0"

}

module "gke-secondary" {
  source                 = "./modules/gke-cluster"
  project_id                = var.project_id
  name                   = var.cluster_name_secondary
  region                 = var.region_secondary
  zones                  = var.zones_secondary
  network                = var.network
  subnet                 = var.subnet_secondary
  master_ipv4_cidr_block = "10.1.0.0/28"
  master_authorized_networks_block = "0.0.0.0/0"
  master_authorized_networks_block2 = "0.0.0.0/0"
}