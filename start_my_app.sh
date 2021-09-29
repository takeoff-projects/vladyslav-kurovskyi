#!/bin/bash
#it will create all resources described in main.tf

#########variables
ProjectID="roi-takeoff-user79"
##################
if [ $GOOGLE_CLOUD_PROJECT == "" ]; then
	export GOOGLE_CLOUD_PROJECT=$ProjectID
fi
echo "ProjectID ="$GOOGLE_CLOUD_PROJECT

gcloud builds submit --tag gcr.io/$GOOGLE_CLOUD_PROJECT/app

#cd terraform
#uncomment for the first start
#gcloud datastore databases create --region=us-central
terraform init && terraform apply -auto-approve