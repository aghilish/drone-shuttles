module "acm" {
  source           = "github.com/terraform-google-modules/terraform-google-kubernetes-engine//modules/acm"
  project_id       = var.project_id

  location         = module.gke.location
  cluster_name     = module.gke.name
  cluster_endpoint = module.gke.endpoint

  sync_repo        = var.acm_sync_repo
  sync_branch      = var.acm_sync_branch
  policy_dir       = var.acm_policy_dir
  operator_path    = var.operator_path

  source_format    = "unstructured"
}


output "git_public_key" {
  value       = module.acm.git_creds_public
  description = "The public key for the git repo."
  sensitive   = false
}