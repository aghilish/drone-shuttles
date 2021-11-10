module "base-infrastructure" {
    source = "./modules/base-infrastructure"

    project_id = var.project_id
    network = var.network
    region_primary = var.region_primary
    region_secondary = var.region_secondary

}