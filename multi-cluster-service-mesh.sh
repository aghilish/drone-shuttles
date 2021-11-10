#!/usr/bin/env bash

curl -LO https://storage.googleapis.com/gke-release/asm/istio-1.10.4-asm.6-linux-amd64.tar.gz
tar xzf istio-1.10.4-asm.6-linux-amd64.tar.gz
sudo cp istio-1.10.4-asm.6/bin/* /usr/local/bin

export PROJECT_DIR=.
export PROJECT_ID=$(gcloud config list --format 'value(core.project)')
export CLUSTER_1_LOCATION=europe-west3-b
export CLUSTER_2_LOCATION=europe-west1-b
export CLUSTER_1_NAME=primary
export CLUSTER_2_NAME=secondary

export CTX_1=gke_${PROJECT_ID}_${CLUSTER_1_LOCATION}_${CLUSTER_1_NAME}
export CTX_2=gke_${PROJECT_ID}_${CLUSTER_2_LOCATION}_${CLUSTER_2_NAME}

gcloud container clusters get-credentials ${CLUSTER_1_NAME} --zone ${CLUSTER_1_LOCATION} --project ${PROJECT_ID}
gcloud container clusters get-credentials ${CLUSTER_2_NAME} --zone ${CLUSTER_2_LOCATION} --project ${PROJECT_ID}


istioctl x create-remote-secret --context=${CTX_1} --name=${CLUSTER_1_NAME} | \
  kubectl apply -f - --context=${CTX_2}

istioctl x create-remote-secret --context=${CTX_2} --name=${CLUSTER_2_NAME} | \
  kubectl apply -f - --context=${CTX_1}


istioctl x create-remote-secret --context=${CTX_1} --name=${CLUSTER_1_NAME} > ${CTX_1}.secret

istioctl x create-remote-secret --context=${CTX_2} --name=${CLUSTER_2_NAME} > ${CTX_2}.secret


IFS="_" read -r -a VALS <<< ${CTX_1}
PROJECT_1=${VALS[1]}
LOCATION_1=${VALS[2]}
CLUSTER_1=${VALS[3]}
PRIV_IP=`gcloud container clusters describe "${CLUSTER_1}" --project "${PROJECT_1}" \
    --zone "${LOCATION_1}" --format "value(privateClusterConfig.privateEndpoint)"`

sed -i 's/server\:.*/server\: https:\/\/'"${PRIV_IP}"'/' ${CTX_1}.secret

IFS="_" read -r -a VALS <<< ${CTX_2}
PROJECT_2=${VALS[1]}
LOCATION_2=${VALS[2]}
CLUSTER_2=${VALS[3]}
PRIV_IP=`gcloud container clusters describe "${CLUSTER_2}" --project "${PROJECT_2}" \
    --zone "${LOCATION_2}" --format "value(privateClusterConfig.privateEndpoint)"`


sed -i 's/server\:.*/server\: https:\/\/'"${PRIV_IP}"'/' ${CTX_2}.secret

kubectl apply -f ${CTX_1}.secret --context=${CTX_2}
kubectl apply -f ${CTX_2}.secret --context=${CTX_1}


POD_IP_CIDR_1=`gcloud container clusters describe ${CLUSTER_1} --project ${PROJECT_1} --zone ${LOCATION_1} \
  --format "value(ipAllocationPolicy.clusterIpv4CidrBlock)"`

POD_IP_CIDR_2=`gcloud container clusters describe ${CLUSTER_2} --project ${PROJECT_2} --zone ${LOCATION_2} \
  --format "value(ipAllocationPolicy.clusterIpv4CidrBlock)"`

EXISTING_CIDR_1=`gcloud container clusters describe ${CLUSTER_1} --project ${PROJECT_1} --zone ${LOCATION_1} \
 --format "value(masterAuthorizedNetworksConfig.cidrBlocks.cidrBlock)"`
# gcloud container clusters update ${CLUSTER_1} --project ${PROJECT_1} --zone ${LOCATION_1} \
# --enable-master-authorized-networks \
# --master-authorized-networks ${POD_IP_CIDR_2},${EXISTING_CIDR_1//;/,}

EXISTING_CIDR_2=`gcloud container clusters describe ${CLUSTER_2} --project ${PROJECT_2} --zone ${LOCATION_2} \
 --format "value(masterAuthorizedNetworksConfig.cidrBlocks.cidrBlock)"`
# gcloud container clusters update ${CLUSTER_2} --project ${PROJECT_2} --zone ${LOCATION_2} \
# --enable-master-authorized-networks \
# --master-authorized-networks ${POD_IP_CIDR_1},${EXISTING_CIDR_2//;/,}


gcloud container clusters update ${CLUSTER_1} --project ${PROJECT_1} --zone ${LOCATION_1} \
 --enable-master-global-access

gcloud container clusters update ${CLUSTER_2} --project ${PROJECT_2} --zone ${LOCATION_2} \
 --enable-master-global-access
    
