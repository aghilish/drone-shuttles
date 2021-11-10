resource "google_compute_network" "vpc_network" {
  project       = var.project_id
  name = var.network
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges-germany" {
  project       = var.project_id
  name          = "subnetwork-germany"
  ip_cidr_range = "10.156.0.0/16"
  region        = "europe-west3"
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = true
  private_ipv6_google_access = true
}

resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges-belgium" {
  project       = var.project_id
  name          = "subnetwork-belgium"
  ip_cidr_range = "10.154.0.0/16"
  region        = "europe-west1"
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = true
  private_ipv6_google_access = true
}
