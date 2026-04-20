Pod::Spec.new do |spec|
  spec.name         = "FlashNotifications"
  spec.version      = "1.0.0"
  spec.summary      = "Beautiful and customizable iOS notifications framework"
  
  spec.description  = <<-DESC
FlashNotifications is a lightweight and customizable notifications framework for iOS.
It provides a simple API for displaying notifications with minimal setup.
  DESC

  spec.homepage     = "https://github.com/Souravkumarsingh/FlashNotifications"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Sourav Kumar Singh" => "your-email@example.com" }
  
  spec.platform     = :ios, "13.0"
  spec.source       = { :http => "https://github.com/Souravkumarsingh/FlashNotifications/releases/download/#{spec.version}/FlashNotifications.xcframework.zip" }
  
  # Use the pre-built XCFramework (downloaded from GitHub release)
  spec.vendored_frameworks = "FlashNotifications.xcframework"
  
  # If your framework has dependencies, add them here
  # spec.dependency "SomeDependency", "~> 1.0"
end
