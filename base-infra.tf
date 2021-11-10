module "base-infrastructure" {
    source = "./modules/base-infrastructure"

    project_id = var.project_id
    region_primary = var.region_primary
    region_secondary = var.region_secondary
    
    network = var.network
    subnet_primary = var.subnet_primary
    subnet_secondary = var.subnet_secondary
}