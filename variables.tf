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
  default     = "subnet-primary"
}

variable "subnet_secondary" {
  description = "The subnetwork created in the secondary network to host the cluster in"
  default     = "subnet-secondary"
}

variable "subnet_ip_primary" {
  description = "The primary subnetwork ip range"
}

variable "subnet_ip_secondary" {
  description = "The secondary subnetwork ip range"
}

variable "ip_range_pods_name_primary" {
  description = "The secondary ip range to use for pods in the primary cluster"
  default     = "ip-range-pods-primary"
}

variable "ip_range_pods_name_secondary" {
  description = "The secondary ip range to use for pods in the secondary cluster"
  default     = "ip-range-pods-secondary"
}

variable "ip_range_pods_primary" {
  description = "The secondary ip range to use for pods in the primary cluster"
}

variable "ip_range_pods_secondary" {
  description = "The secondary ip range to use for pods in the secondary cluster"
}


variable "ip_range_services_name_primary" {
  description = "The secondary ip range to use for services in the primary cluster"
  default     = "ip-range-scv-primary"
}

variable "ip_range_services_primary" {
  description = "The secondary ip range to use for services in the primary cluster"
}

variable "ip_range_services_name_secondary" {
  description = "The secondary ip range to use for services in the secondary cluster"
  default     = "ip-range-scv-secondary"
}

variable "ip_range_services_secondary" {
  description = "The secondary ip range to use for services in the secondary cluster"
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
  default     = "git@github.com:GoogleCloudPlatform/csp-config-management.git"
}

variable "acm_sync_branch" {
  description = "Anthos config management Git branch"
  type        = string
  default     = "1.0.0"
}

variable "acm_policy_dir" {
  description = "Subfolder containing configs in ACM Git repo"
  type        = string
  default     = "foo-corp"
}

variable "operator_path" {
  description = "Path to the operator yaml config. If unset, will download from GCS releases."
  type        = string
  default     = null
}