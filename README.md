# FlashNotifications

A lightweight iOS notification framework built with UIKit and Swift.

## Features

- Flash notifications with customizable colors and styles
- Built-in success, error, and info notification types
- Delegate support for tap handling
- Smooth animations and automatic dismissal

## Requirements

- iOS 13.0+
- Swift 5.9+

## Installation

### Swift Package Manager

To integrate FlashNotifications into your project using SPM:

1. In Xcode: **File** → **Add Packages...**
2. Enter the repository URL
3. Select the version requirement (e.g., "Up to Next Major")
4. Choose your target and click **Add Package**

Or in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/FlashNotifications.git", from: "1.0.0")
]
```

Then add it to your target:

```swift
targets: [
    .target(
        name: "YourApp",
        dependencies: ["FlashNotifications"]
    )
]
```

## Usage

```swift
import FlashNotifications

// Show a success notification
FlashNotificationManager.showNotification(
    type: FlashNotificationManager.success,
    title: "Success",
    message: "Operation completed successfully",
    dismissDelay: 3.0
)

// Show custom notification
FlashNotificationManager.showNotification(
    textColor: .white,
    backgroundColor: .blue,
    image: UIImage(systemName: "star.fill"),
    title: "Custom",
    message: "This is a custom notification",
    dismissDelay: 2.5
)
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
