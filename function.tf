module "delete-posts" {
  source      = "./modules/function"
  project     = var.project
  name        = "delete-posts"
  entry_point = "app"
}