cask "bee360@preview" do
  version "2.11.5"
  sha256 "48a56e2d23d168dc77a119cc2105a1457293d1acc42312c5051978a7fe52e09e"

  url "https://github.com/Bee360-Platform/bee360-app/releases/download/v#{version}/Bee360-app_#{version}.dmg"
  name "bee360 Preview"
  desc "Desktop client for Bee360 (preview channel)"
  homepage "https://www.bee360.com/"

  conflicts_with cask: "bee360"
  depends_on macos: :monterey

  app "Bee360.app"
end
