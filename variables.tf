variable "project_id" {
  description = "The project ID to host the cluster in"
}

variable "cluster_name_primary" {
  description = "The name for the primary GKE cluster"
}

variable "cluster_name_secondary" {
  description = "The name for the primary GKE cluster"
}

variable "region_primary" {
  description = "The region to host the primary cluster in"
}

variable "region_secondary" {
  description = "The region to host the secondary cluster in"
}

variable "network" {
  description = "The VPC network created to host the cluster in"
  default     = "gke-network"
}

variable "subnet_primary" {
  description = "The subnetwork created in the primary network to host the cluster in"
}

variable "subnet_secondary" {
  description = "The subnetwork created in the secondary network to host the cluster in"
}

variable "zones_primary" {
  type        = list(string)
  description = "The zone to host the primary cluster in"
}

variable "zones_secondary" {
  type        = list(string)
  description = "The zone to host the secondary cluster in"
}

variable "acm_sync_repo" {
  description = "Anthos config management Git repo"
  type        = string
}

variable "acm_sync_branch" {
  description = "Anthos config management Git branch"
  type        = string
}

variable "acm_policy_dir" {
  description = "Subfolder containing configs in ACM Git repo"
  type        = string
}

variable "operator_path" {
  description = "Path to the operator yaml config. If unset, will download from GCS releases."
  type        = string
}