module "asm" {
  source                    = "github.com/terraform-google-modules/terraform-google-kubernetes-engine//modules/asm"
  project_id                = var.project_id
  
  cluster_name              = module.gke.name
  cluster_endpoint          = module.gke.endpoint
  location                  = module.gke.location
  
  enable_cluster_roles      = true
  enable_cluster_labels     = true
  enable_gcp_apis           = true
  enable_gcp_components     = true
  enable_namespace_creation = true
  enable_all = true
  
  options                   = ["envoy-access-log"]
  outdir                    = "./${module.gke.name}-outdir"
}