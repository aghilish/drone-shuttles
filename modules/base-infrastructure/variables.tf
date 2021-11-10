variable "project_id" {
  description = "The project ID to host the cluster in"
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


