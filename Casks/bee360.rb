cask "bee360" do
  version "2.11.5"
  sha256 "48a56e2d23d168dc77a119cc2105a1457293d1acc42312c5051978a7fe52e09e"

  url "https://github.com/Bee360-Platform/bee360-app/releases/download/v#{version}/Bee360-app_#{version}.dmg"
  name "bee360"
  desc "Desktop client for Bee360"
  homepage "https://www.bee360.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "bee360@preview"
  depends_on macos: :monterey

  app "Bee360.app"
end
