Pod::Spec.new do |spec|
  spec.name         = "FlashNotifications"
  spec.version      = "1.0.0"
  spec.summary      = "Beautiful and customizable iOS notifications framework"
  
  spec.description  = <<-DESC
FlashNotifications is a lightweight and customizable notifications framework for iOS.
It provides a simple API for displaying notifications with minimal setup.
Distributed as a pre-compiled binary framework.
  DESC

  spec.homepage     = "https://github.com/Souravkumarsingh/FlashNotifications"
  spec.license      = { :type => "MIT" }
  spec.author       = { "Sourav Kumar Singh" => "your-email@example.com" }
  
  spec.platform     = :ios, "13.0"
  
  # Option 1: Download from GitHub release (recommended)
  spec.source       = { :http => "https://github.com/Souravkumarsingh/FlashNotifications/releases/download/1.0.0/FlashNotifications.xcframework.zip" }
  spec.vendored_frameworks = "FlashNotifications.xcframework"
  
  # Alternative Option: Use git source (requires XCFramework in repo)
  # spec.source       = { :git => "https://github.com/Souravkumarsingh/FlashNotifications.git", :tag => "1.0.0" }
  # spec.vendored_frameworks = "FlashNotifications.xcframework"
end
