###########################
## DEV Configurations ##
###########################

project_id                   = "festive-airway-318510"
network                      = "gke-network"

#####################
## gke Configurtion##
#####################


cluster_name_primary = "primary"
cluster_name_secondary = "secondary"
region_primary = "europe-west3"
region_secondary = "europe-west1"

subnet_primary = "subnetwork-germany"
subnet_secondary = "subnetwork-belgium"

subnet_ip_primary = "10.0.0.0/28"
subnet_ip_secondary = "10.1.0.0/28"

ip_range_pods_name_primary = "ip-range-pods-primary"
ip_range_pods_primary = "10.152.0.0/24"

ip_range_pods_name_secondary = "ip-range-pods-secondary"
ip_range_pods_secondary = "10.154.0.0/24"

ip_range_services_name_primary = "ip-range-scv-primary"
ip_range_services_primary = "10.156.0.0/24"

ip_range_services_name_secondary = "ip-range-scv-secondary"
ip_range_services_secondary = "10.158.0.0/24"

zones_primary    = ["europe-west3-b"]
zones_secondary  = ["europe-west1-b"]

acm_sync_repo           = "git@github.com:GoogleCloudPlatform/csp-config-management.git"
acm_sync_branch         = "1.0.0"
acm_policy_dir          = "foo-corp"

