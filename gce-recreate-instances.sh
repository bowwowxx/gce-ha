#!/bin/bash
gcloud compute --project "es-source-db" instance-groups managed recreate-instances  "elastic-api-group" --zone "asia-east1-a" --instance "elastic-api-group-06lt,elastic-api-group-vtxv"
