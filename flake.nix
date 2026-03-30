{
  description = "blackhole - Kong configuration lab environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            opentofu
            kubectl
            kubernetes-helm
            google-cloud-sdk
            just
            _1password-cli
          ];

          shellHook = ''
            echo "Loading secrets from 1Password (kong-lab vault)..."
            export GCP_PROJECT=$(op read "op://kong-lab/gcp/project-id" 2>/dev/null || echo "")
            export GCP_PRIMARY_REGION=$(op read "op://kong-lab/gcp/primary-region" 2>/dev/null || echo "")
            export GCP_SECONDARY_REGION=$(op read "op://kong-lab/gcp/secondary-region" 2>/dev/null || echo "")
            export KONG_LICENSE_DATA=$(op read "op://kong-lab/kong-license/license" 2>/dev/null || echo "")
            export KONNECT_INSTALL_TOKEN=$(op read "op://kong-lab/konnect/install-token" 2>/dev/null || echo "")
            export KONNECT_PAT=$(op read "op://kong-lab/konnect/automation-pat" 2>/dev/null || echo "")
            export KONNECT_ORG_ID=$(op read "op://kong-lab/konnect/org-id" 2>/dev/null || echo "")

            if [ -z "$GCP_PROJECT" ]; then
              echo "Warning: Could not load secrets from 1Password. Ensure you are signed in (op signin)."
            else
              echo "Secrets loaded."
            fi
          '';
        };
      });
}
