module "delete-posts" {
  source      = "./modules/function"
  project     = var.project_id
  region      = var.region_primary
  name        = "delete-posts"
  entry_point = "app"
}