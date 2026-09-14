# Ledge: an ADHD-first sidebar notepad for Mac, iPhone, iPad and Apple Watch.
# Notarized Developer ID build from https://github.com/ShashankKarpal/ledge.
# Built by Claude (Anthropic).
cask "ledge" do
  version "0.5.2"
  sha256 "e3a7ea9a023ba81403103cf81d365b613da7992e89b180cf7bf490d128f1aa76"

  url "https://github.com/ShashankKarpal/ledge/releases/download/v#{version}/Ledge-v#{version}-macOS.zip"
  name "Ledge"
  desc "ADHD-first sidebar notepad: one hotkey, plain Markdown in a folder you own"
  homepage "https://github.com/ShashankKarpal/ledge"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Ledge.app"

  uninstall quit: "com.shashankkarpal.ledge.mac"

  # Zap removes the app's own settings and the local safety copies (capture
  # log, editor journal, backups). It never touches the notes folder in
  # iCloud Drive; that is yours.
  zap trash: [
    "~/Library/Application Support/Ledge",
    "~/Library/Preferences/com.shashankkarpal.ledge.mac.plist",
  ]
end
