# List available recipes
default:
    @just --list

# Check that all required tools are installed
check-deps:
    @./scripts/check-deps.sh

# Scaffold a new lab (e.g., just new-lab my-experiment)
new-lab name:
    @if [ -d "labs/{{name}}" ]; then gum log --level error "Lab '{{name}}' already exists"; exit 1; fi
    cp -r templates/lab "labs/{{name}}"
    sed -i 's/LAB_NAME/{{name}}/g' "labs/{{name}}/main.tf" "labs/{{name}}/justfile"
    gum log --level info "Created labs/{{name}} — cd into it and run 'just up'"

# Authenticate with GCP
gcp-auth:
    gcloud auth login
    gcloud auth application-default login
    gum spin --title "Configuring gcloud project..." -- \
      gcloud config set project $TF_VAR_project_id
    gum spin --title "Configuring gcloud region..." -- \
      gcloud config set compute/region $TF_VAR_region
    gum log --level info "GCP authentication complete."
