# Pipes Homebrew Tap

Private Homebrew tap for installing Pipes desktop tools.

## Pipes Local

Pipes Local is a local-first desktop workspace for Pipes-organized repositories. It gives teams a native UI for browsing project memory, editing structured Markdown records, running local terminal workflows, and coordinating agent-assisted delivery pipelines against a selected local workspace.

Pipes Local is built for repositories that treat planning, decisions, outcomes, instructions, team roles, and pipeline workflows as versioned project memory.

### Features

- Browse and edit Pipes project records such as goals, roadmap items, plans, decisions, outcomes, and releases.
- Work with modular AI instruction surfaces, including fragments, pipelines, rules, and generated agent entrypoints.
- Run terminal and agent-assisted workflows from a local desktop surface.
- Inspect and manage structured Markdown records while preserving repository-first ownership.
- Use a local filesystem workflow; project data stays in the workspace you open.

### Distribution Model

This tap installs a packaged `Pipes Local.app` cask from a private GitHub Release asset hosted in this repository.

Installers need access to `dyegovasc/homebrew-pipes` so Homebrew can download the private release asset. They do not need access to the private source repository.

## Install

Installers need a GitHub token that can read this private tap repository and its release assets.

```sh
export HOMEBREW_GITHUB_API_TOKEN=your_github_token
brew tap dyegovasc/pipes https://github.com/dyegovasc/homebrew-pipes.git
brew install --cask dyegovasc/pipes/pipes-local
```

If you use GitHub CLI and it is authenticated with the right account, you can set the token with:

```sh
export HOMEBREW_GITHUB_API_TOKEN="$(gh auth token)"
```

## Update

```sh
brew update
brew upgrade --cask dyegovasc/pipes/pipes-local
```

If an unmanaged copy already exists in `/Applications`, move it aside before installing:

```sh
mv "/Applications/Pipes Local.app" "/Applications/Pipes Local.app.backup-$(date +%Y%m%d-%H%M%S)"
brew install --cask dyegovasc/pipes/pipes-local
```

## Uninstall

```sh
brew uninstall --cask pipes-local
```

## Internal Release Flow

From the `pipes-local` source repository, maintainers publish a new binary and update this tap with:

```sh
bun run distribute
```

That command builds and signs the app, uploads the versioned zip to a `dyegovasc/homebrew-pipes` GitHub Release, renders `Casks/pipes-local.rb`, commits the cask update, and pushes this tap.
