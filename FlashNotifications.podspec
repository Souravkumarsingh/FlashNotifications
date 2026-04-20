Pod::Spec.new do |spec|
  spec.name         = "FlashNotifications"
  spec.version      = "1.0.0"
  spec.summary      = "Beautiful and customizable iOS notifications framework"
  
  spec.description  = <<-DESC
FlashNotifications is a lightweight and easy-to-use notifications framework for iOS.
It provides a simple API for displaying beautiful, customizable notifications.
The framework is distributed as a pre-compiled binary for fast integration.
  DESC

  spec.homepage     = "https://github.com/Souravkumarsingh/FlashNotifications"
  spec.license      = { :type => "MIT" }
  spec.author       = { "Sourav Kumar Singh" => "sauravkumarsingh.singh@gmail.com" }
  
  spec.platform     = :ios, "13.0"
  spec.swift_version = "5.0"
  
  # Download pre-built binary from GitHub release
  spec.source       = { :http => "https://github.com/Souravkumarsingh/FlashNotifications/releases/download/1.0.0/FlashNotifications.xcframework.zip" }
  
  # Specify the pre-built XCFramework
  spec.vendored_frameworks = "FlashNotifications.xcframework"
  
  # No dependencies for binary distribution
  spec.requires_arc = false
  
end
