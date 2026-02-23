# FlashNotifications

A lightweight iOS notification framework built with UIKit and Swift - **Distributed as a pre-compiled binary XCframework**.

## Features

- Flash notifications with customizable colors and styles
- Built-in success, error, and info notification types
- Delegate support for tap handling
- Smooth animations and automatic dismissal
- **Pre-compiled binary - no source code included**

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

#### In your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Souravkumarsingh/FlashNotifications.git", from: "1.0.0")
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

### Import
```swift
import FlashNotifications
```

### Show a Success Notification
```swift
FlashNotificationManager.showNotification(
    type: FlashNotificationManager.success,
    title: "Success",
    message: "Operation completed successfully",
    dismissDelay: 3.0
)
```

### Show Error Notification
```swift
FlashNotificationManager.showNotification(
    type: FlashNotificationManager.error,
    title: "Error",
    message: "Something went wrong",
    dismissDelay: 3.0
)
```

### Show Info Notification
```swift
FlashNotificationManager.showNotification(
    type: FlashNotificationManager.info,
    title: "Info",
    message: "Here's some information",
    dismissDelay: 3.0
)
```

### Custom Notification
```swift
FlashNotificationManager.showNotification(
    textColor: .white,
    backgroundColor: .systemBlue,
    image: UIImage(systemName: "star.fill"),
    title: "Custom",
    message: "Your custom message",
    dismissDelay: 2.5
)
```

## Distribution Format

FlashNotifications is distributed as a **pre-compiled XCframework binary**, which means:

- ✅ No source code is exposed
- ✅ Faster integration (no compilation required)
- ✅ Includes arm64 for iOS devices
- ✅ Includes arm64 and x86_64 for iOS Simulator
- ✅ Works seamlessly with Swift Package Manager

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Additional Documentation

- **[QUICKSTART.md](QUICKSTART.md)** - Quick reference guide
- **[INTEGRATION.md](INTEGRATION.md)** - Comprehensive integration examples

