cask "blik" do
  version "1.2"
  sha256 "7275d76230a4a4316390b1e8782c58a2dfc4e6a475a420e67a1e1b5b635f1d1f"

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
