# output "git_password_primary" {
#   value       = module.clusters[0].git_password
#   description = "The public key for the git repo."
#   sensitive   = false
# }

# output "git_password_secondary" {
#   value       = module.clusters[1].git_password
#   description = "The public key for the git repo."
#   sensitive   = false
# }


# output "cluster_name" {
#   description = "Cluster name"
#   value       = module.gke.name
# }

# output "network_name" {
#   description = "The name of the VPC being created"
#   value       = module.gcp-network.network_name
# }

# output "subnet_name" {
#   description = "The name of the subnet being created"
#   value       = module.gcp-network.subnets_names
# }

# output "subnet_secondary_ranges" {
#   description = "The secondary ranges associated with the subnet"
#   value       = module.gcp-network.subnets_secondary_ranges
# }

# output "kubernetes_endpoint" {
#   sensitive = true
#   value     = module.gke.endpoint
# }

# output "client_token" {
#   sensitive = true
#   value     = base64encode(data.google_client_config.default.access_token)
# }

# output "ca_certificate" {
#   value = module.gke.ca_certificate
# }

# output "service_account" {
#   description = "The default service account used for running nodes."
#   value       = module.gke.service_account
# }

# output "acm_git_creds_public" {
#   description = "Public key of SSH keypair to allow the Anthos Operator to authenticate to your Git repository."
#   value       = module.acm.git_creds_public
# }

# output "master_kubernetes_version" {
#   description = "The master Kubernetes version"
#   value       = module.gke.master_version
# }

# output "identity_namespace" {
#   value = module.gke.identity_namespace
# }
