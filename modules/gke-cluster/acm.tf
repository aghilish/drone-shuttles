module "acm" {
  source           = "github.com/terraform-google-modules/terraform-google-kubernetes-engine//modules/acm"
  project_id       = var.project_id
  location         = module.gke.location
  cluster_name     = module.gke.name
  sync_repo        = var.acm_sync_repo
  sync_branch      = var.acm_sync_branch
  policy_dir       = var.acm_policy_dir
  cluster_endpoint = module.gke.endpoint
  operator_path    = var.operator_path
}