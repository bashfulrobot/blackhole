# List available recipes
default:
    @just --list

# Check that all required tools are installed
check-deps:
    @./scripts/check-deps.sh

# Scaffold a new lab (e.g., just new-lab my-experiment)
new-lab name:
    @if [ -d "labs/{{name}}" ]; then echo "Lab '{{name}}' already exists"; exit 1; fi
    cp -r templates/lab "labs/{{name}}"
    sed -i 's/LAB_NAME/{{name}}/g' "labs/{{name}}/main.tf" "labs/{{name}}/justfile"
    @echo "Created labs/{{name}} — cd into it and run 'just up'"

# Authenticate with GCP
gcp-auth:
    gcloud auth login
    gcloud config set project $TF_VAR_project_id
    gcloud config set compute/region $TF_VAR_region
