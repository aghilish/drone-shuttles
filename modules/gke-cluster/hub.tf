module "hub" {
  source                  = "github.com/terraform-google-modules/terraform-google-kubernetes-engine//modules/hub"
  project_id              = var.project_id
  location                = module.gke.location
  cluster_name            = module.gke.name
  cluster_endpoint        = module.gke.endpoint
  gke_hub_membership_name = var.name
  gke_hub_sa_name         = var.name
}