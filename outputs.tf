output "public_key_primary" {
  value       = module.gke-primary.git_public_key
  description = "The public key for the git repo."
  sensitive   = false
}

output "public_key_secondary" {
  value       = module.gke-secondary.git_public_key
  description = "The public key for the git repo."
  sensitive   = false
}

output "function_url" {
  value = module.delete-posts.function_url
}