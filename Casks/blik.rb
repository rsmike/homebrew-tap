cask "blik" do
  version "1.0"
  sha256 "bceb12d78ea305a5c6ada4e14b3cba8f52ae51433396a293b17d2a501956d397"

  url "https://github.com/rsmike/blik/releases/download/v#{version}/Blik-#{version}.zip"
  name "Blik"
  desc "Menu bar reminders to blink, sit up and rest, with a focus timer"
  homepage "https://github.com/rsmike/blik"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Blik.app"

  # Blik is not notarized, so macOS would refuse to open the downloaded copy.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Blik.app"], must_succeed: false
  end

  uninstall quit: "com.rsmike.Blik"

  zap trash: "~/Library/Preferences/com.rsmike.Blik.plist"
end
