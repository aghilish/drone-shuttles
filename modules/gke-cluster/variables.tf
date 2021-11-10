variable "project_id" {
  description = "The project ID to host the cluster in"
}

variable "name" {
  description = "The name for the GKE cluster"
}

variable "region" {
  description = "The region to host the cluster in"
}

variable "zones" {
  description = "The zones to be used"
}

variable "network" {
  description = "The VPC network created to host the cluster in"
}

variable "subnet" {
  description = "The subnetwork created in the network to host the cluster in"
}

variable "master_ipv4_cidr_block" {
  description = "The master cidr to be used"
}

variable "master_authorized_networks_block" {
  description = "The master authorised network to be used"
}

variable "master_authorized_networks_block2" {
  description = "The master authorised network to be used"
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
