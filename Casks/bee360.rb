cask "bee360" do
  version "2.9.3"
  sha256 "f864d5cf59d06ab267cff6423f64c04214b0962023591e1082dc2a7dc002674a"

  url "https://github.com/Bee360-Platform/bee360-app/releases/download/v#{version}/Bee360-app_#{version}.dmg"
  name "bee360"
  desc "Desktop client for Bee360"
  homepage "https://www.bee360.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "bee360@preview"

  app "Bee360.app"
end
