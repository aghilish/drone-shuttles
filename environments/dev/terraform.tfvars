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

zones_primary    = ["europe-west3-b"]
zones_secondary  = ["europe-west1-b"]

acm_sync_repo           = "git@github.com:GoogleCloudPlatform/csp-config-management.git"
acm_sync_branch         = "1.0.0"
acm_policy_dir          = "foo-corp"
operator_path           = "config-management-operator.yaml"

