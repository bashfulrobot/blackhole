# List available recipes
default:
    @just --list

# Authenticate with GCP
gcp-auth:
    gcloud auth login
    gcloud config set project $GCP_PROJECT
    gcloud config set compute/region $GCP_PRIMARY_REGION
