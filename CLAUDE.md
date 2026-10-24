# CLAUDE.md

Homebrew tap for the owner's notarized Mac apps (`brew install --cask shashankkarpal/tap/<app>`). Public repo.

## Rules for every session

1. Publish order: the app's release comes first. Push the app repo, tag the audited commit, publish the release with the notarized zip, then download the asset back and confirm its SHA-256. Only then commit and push the cask with that `sha256`. A cask pointing at a missing or rebuilt zip fails for every user (404 or checksum mismatch).
2. Every cask pins `sha256`; never `:no_check`. `url` points at the app's own GitHub release.
3. Check with `brew style Casks/<app>.rb` and `brew audit --cask --strict --online shashankkarpal/tap/<app>` after the release exists, then a real `brew install --cask` and `brew uninstall --cask` round trip.
4. `uninstall` directives also run on `brew upgrade` and `reinstall` (Homebrew skips only `signal`). A `launchctl` entry therefore removes that LaunchAgent on every upgrade; say so in `caveats`.
5. Never commit secrets. The gitleaks workflow stays.
