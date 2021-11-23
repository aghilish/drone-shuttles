# drone-shuttles

TODO Add something here when I know what I am doing

TODO Add link to installation prodcedure

terraform init -backend-config=./environments/dev/backend.config

terraform plan -var-file=./environments/dev/terraform.tfvars

terraform apply -var-file=./environments/dev/terraform.tfvars

gcloud container clusters get-credentials primary --zone europe-west3-b --project festive-airway-318510

kubectl port-forward demo-mariadb-0 3306:3306 -n ghost

mysql -u bn_ghost -h 127.0.0.1 -p