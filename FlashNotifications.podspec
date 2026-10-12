Pod::Spec.new do |spec|
  spec.name         = "FlashNotifications"
  spec.version      = "1.0.1"
  spec.summary      = "Lightweight customizable flash notifications for iOS (UIKit)"

  spec.description  = <<-DESC
FlashNotifications is a lightweight iOS notifications framework built with UIKit.
It provides a simple API for displaying customizable flash messages with success,
error, and info styles, tap handling, and automatic dismissal.
Distributed as a pre-compiled XCFramework for fast integration.
  DESC

  spec.homepage     = "https://github.com/Souravkumarsingh/FlashNotifications"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Sourav Kumar Singh" => "sauravkumarsingh.singh@gmail.com" }
  spec.social_media_url = "https://github.com/Souravkumarsingh"

  spec.platform     = :ios, "13.0"
  spec.swift_versions = "5.0"
  spec.swift_version  = "5.0"

  # Git source so CocoaPods metadata/search can index README + LICENSE from the repo.
  # Binary XCFramework is vendored from the tagged commit.
  spec.source       = {
    :git => "https://github.com/Souravkumarsingh/FlashNotifications.git",
    :tag => "#{spec.version}"
  }

  spec.vendored_frameworks = "FlashNotifications.xcframework"
  spec.requires_arc = true
end
