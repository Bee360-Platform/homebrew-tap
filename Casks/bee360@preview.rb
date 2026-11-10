cask "bee360@preview" do
  version "2.11.6"
  sha256 "4775a7fdc7fa51b8a75e925e73ebd555077bdd2d16ead8be9fdff4bd719e4138"

  url "https://github.com/Bee360-Platform/bee360-app/releases/download/v#{version}/Bee360-app_#{version}.dmg"
  name "bee360 Preview"
  desc "Desktop client for Bee360 (preview channel)"
  homepage "https://www.bee360.com/"

  conflicts_with cask: "bee360"
  depends_on macos: :monterey

  app "Bee360.app"
end
