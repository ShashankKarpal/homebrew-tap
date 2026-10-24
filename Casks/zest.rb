# Zest: a menu bar battery command center for Apple Silicon Macs.
# Notarized Developer ID build from https://github.com/ShashankKarpal/zest.
# Built by Claude (Anthropic).
cask "zest" do
  version "3.1"
  sha256 "6bc364b24a11ee7c7c0643db1fed893263f41bd91eac67ff00727e2fd195806e"

  url "https://github.com/ShashankKarpal/zest/releases/download/v#{version}/Zest-v#{version}-macOS.zip"
  name "Zest"
  desc "Menu bar battery command center: health, power flow, per-app energy, alerts"
  homepage "https://github.com/ShashankKarpal/zest"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Zest.app"

  # The repo's scripts/install-launchagent.sh can register a KeepAlive LaunchAgent
  # (com.zest.app). Homebrew runs launchctl before quit, so the job is booted out and its
  # plist deleted first; otherwise launchd would relaunch the app the moment it quits, and
  # keep retrying a deleted app forever.
  uninstall launchctl: "com.zest.app",
            quit:      "com.shanky.zest"

  # Zap removes settings and history (config, battery and energy history, alert history,
  # exports). The optional root helper is installed by hand from a clone and is removed the
  # same way: sudo bash zest-smc/uninstall-helper.sh.
  zap trash: [
    "~/Library/Application Support/Zest",
    "~/Library/Preferences/com.shanky.zest.plist",
  ]
end
