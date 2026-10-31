# Dotfiles

Personal macOS configuration managed with [chezmoi](https://www.chezmoi.io/) and Git.

## First-time setup

```sh
brew install chezmoi
chezmoi init --apply <private-repository-url>
brew bundle install --file="$HOME/.Brewfile" --no-upgrade
```

This repository contains a work email address, so keep the remote private.

`dot_Brewfile` restores to `~/.Brewfile` and lists the shared Go and mobile
development tools for Intel and Apple Silicon Macs. Install Homebrew for the
Mac's native architecture before running the commands above.

After installing the packages:

- Use `fnm install` in projects with a `.node-version` or `.nvmrc` file to install
  their Node version, then select it with `fnm use`.
- Open Xcodes to install the project's Xcode version. Open Xcode to finish its
  first-launch setup and install the required simulator runtimes.
- Open Android Studio to install the project's Android SDK, build tools, and
  emulator images. The Brewfile includes JDK 17; use the JDK your project's
  Android Gradle plugin requires.
- For projects with a `Gemfile`, run `bundle install` and use
  `bundle exec pod install` for their pinned CocoaPods version.

Keep the Brewfile curated: add packages needed on every development Mac directly
to `dot_Brewfile`, then run `chezmoi apply` and the bundle command above. A full
`brew bundle dump --force` would replace this list with every installed package.

## Daily use

```sh
# Import a new file or refresh its source copy.
chezmoi add ~/.config/example/config

# Edit, review, and apply a managed file.
chezmoi edit ~/.zshrc
chezmoi diff
chezmoi apply

# Commit changes.
chezmoi cd
git status
git add .
git commit
```

Never add credentials directly. Use chezmoi encryption or a password-manager
template for files containing tokens, passwords, or private keys.

## Agent skills

`chezmoi apply` restores the inventoried agent skills globally for Antigravity,
Claude Code, Codex, Zed, and OpenCode. Third-party skills are declared in
`.chezmoidata.json`; local or retired skills are stored in `agent-skills/`.

Manage the installed collection with:

```sh
npx skills find <query>
npx skills list
npx skills check
npx skills update -g
npx skills remove --global <skill>
```

After intentionally adding or removing a skill, update the inventory so a new
machine receives the same collection. Review every skill and its scripts before
adding it: skills run with the agent's permissions.
