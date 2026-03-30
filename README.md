# blackhole

A monorepo for Kong configuration experiments and labs.

## Structure

- `base/` — Reusable OpenTofu infrastructure (GKE on GCP) shared by all labs
- `labs/` — Each subfolder is an independent experiment with its own Kong configuration

## Prerequisites

- [devenv](https://devenv.sh/) for development environments
- [1Password CLI](https://developer.1password.com/docs/cli/) for secrets
- [just](https://github.com/casey/just) as a task runner

## Getting Started

```sh
devenv shell
```
