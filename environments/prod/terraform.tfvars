###########################
## PROD Configurations ##
###########################

project                      = "bdaa-ctda-kg-prd-sc-51jv4"
region                       = "europe-west3"
zone                         = "europe-west3-b"

#####################
## gke Configurtion##
#####################

primary_region   = "europe-west3"
primary_zones    = ["europe-west3-b"]
secondary_region = "europe-west1"
secondary_zones  = ["europe-west1-b"]

acm_repo_location = "ssh://cb2aghz@ztb.icb.commerzbank.com@source.developers.google.com:2022/p/bdaa-anthos-cb2aghz-tbx-lc1uno/r/cluster-config"
acm_branch        = "master"
acm_dir           = "usecases"

#####################################
## base-infrastructure Configurtion##
#####################################
