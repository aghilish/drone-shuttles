# drone-shuttles

TODO Add something here when I know what I am doing
TODO Add link to installation prodcedure

terraform init -backend-config=./environments/dev/backend.config

terraform plan -var-file=./environments/dev/terraform.tfvars
terraform apply -var-file=./environments/dev/terraform.tfvars