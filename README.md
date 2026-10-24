# shashankkarpal/tap

Homebrew casks for the Mac apps at https://github.com/ShashankKarpal. Every
cask points at a notarized Developer ID zip on that app's GitHub Releases
page and pins its SHA-256, so `brew` verifies the same bytes the release
notes name.

    brew install --cask shashankkarpal/tap/ledge
    brew install --cask shashankkarpal/tap/zest

| Cask | App | Notes |
|---|---|---|
| `ledge` | [Ledge](https://github.com/ShashankKarpal/ledge) | ADHD-first sidebar notepad. `brew uninstall --cask ledge` quits and removes the app; `--zap` also removes its settings and local safety copies. Your notes folder is never touched. |
| `zest` | [Zest](https://github.com/ShashankKarpal/zest) | Menu bar battery command center, Apple Silicon, macOS 14 or later. `brew uninstall --cask zest` boots out and deletes the `com.zest.app` LaunchAgent if one was installed, then quits and removes the app; `--zap` also removes its settings and history. The optional root helper is removed with its own script from a clone (`sudo bash zest-smc/uninstall-helper.sh`). |

Casks are updated by hand when a release is cut: bump `version`, paste the
`sha256` from the release notes, commit. No automation edits this repository.

MIT. Casks written by Claude (Anthropic) for a single maintainer.
