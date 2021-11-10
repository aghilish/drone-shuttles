data "google_client_config" "default" {}
data "google_project" "project" {
  project_id = var.project_id
}
provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}
module "gke" {
  name                   = var.name
  project_id             = var.project_id
  source                 = "terraform-google-modules/kubernetes-engine/google//modules/beta-public-cluster"
  version                = "16.1.0"
  regional               = false
  region                 = var.region
  network                = var.network
  subnetwork             = var.subnet
  ip_range_pods          = ""
  ip_range_services      = ""
  zones                   = var.zones
  release_channel        = "REGULAR"
  horizontal_pod_autoscaling = true
  network_policy             = false
  cluster_resource_labels = { "mesh_id" : "proj-${data.google_project.project.number}" }
  node_pools = [
    {
      name         = "default-node-pool"
      autoscaling  = false
      auto_upgrade = true
      # Trying larger node pool for ACM to prevent against test flakiness
      node_count   = 4
      machine_type = "e2-standard-4"
    },
  ]

  master_authorized_networks = [{
      cidr_block   = var.master_authorized_networks_block
      display_name = "VPC"
    }
  ]

  node_pools_oauth_scopes = {
    all = []

    default-node-pool = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/source.full_control",
      "https://www.googleapis.com/auth/bigquery",
      "https://www.googleapis.com/auth/devstorage.full_control"
    ]
  }
}


resource "google_compute_firewall" "sidecar-allow" {
  name    = "allow-automatic-sidecar-injection-${var.name}" 
  network = var.network

 
  allow {
    protocol = "tcp"
    ports    = ["15017"]
  }
  
  source_ranges = [var.master_authorized_networks_block]
}
