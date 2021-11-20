module "delete-posts" {
  source      = "./modules/function"
  project     = var.project_id
  name        = "delete-posts"
  entry_point = "app"
}