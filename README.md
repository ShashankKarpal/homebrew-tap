# shashankkarpal/tap

Homebrew casks for the Mac apps at https://github.com/ShashankKarpal. Every
cask points at a notarized Developer ID zip on that app's GitHub Releases
page and pins its SHA-256, so `brew` verifies the same bytes the release
notes name.

    brew install --cask shashankkarpal/tap/ledge

| Cask | App | Notes |
|---|---|---|
| `ledge` | [Ledge](https://github.com/ShashankKarpal/ledge) | ADHD-first sidebar notepad. `brew uninstall --cask ledge` quits and removes the app; `--zap` also removes its settings and local safety copies. Your notes folder is never touched. |

Casks are updated by hand when a release is cut: bump `version`, paste the
`sha256` from the release notes, commit. No automation edits this repository.

MIT. Casks written by Claude (Anthropic) for a single maintainer.
