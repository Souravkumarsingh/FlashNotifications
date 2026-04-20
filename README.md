# FlashNotifications

A lightweight iOS notification framework built with UIKit and Swift - **Distributed as a pre-compiled binary XCframework**.

## 🎬 Demo Video

Watch FlashNotifications in action:

[![FlashNotifications Demo](https://img.youtube.com/vi/2WkZ-_vdFRE/maxresdefault.jpg)](https://youtube.com/shorts/2WkZ-_vdFRE?feature=share)

[View on YouTube](https://youtube.com/shorts/2WkZ-_vdFRE?feature=share)

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

### CocoaPods (Recommended)

Add the following to your `Podfile`:

```ruby
pod 'FlashNotifications', '~> 1.0.0'
```

Then run:
```bash
pod install
```

### Swift Package Manager

To integrate FlashNotifications into your project using SPM:

1. In Xcode: **File** → **Add Packages...**
2. Enter the repository URL: `https://github.com/Souravkumarsingh/FlashNotifications.git`
3. Select branch: `main` (recommended to avoid version caching issues)
4. Choose your target and click **Add Package**

#### In your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Souravkumarsingh/FlashNotifications.git", branch: "main")
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

## API Documentation

### FlashNotificationConfig

A configuration class for customizing notification appearance and behavior.

#### Properties

| Property | Type | Description |
|----------|------|-------------|
| `textColor` | `UIColor?` | Default text color for the notification |
| `titleTextColor` | `UIColor?` | Custom color for the notification title text |
| `messageTextColor` | `UIColor?` | Custom color for the notification message text |
| `backgroundColor` | `UIColor?` | Background color of the notification |
| `image` | `UIImage?` | Optional image to display in the notification |
| `title` | `String?` | Title text of the notification |
| `message` | `String?` | Main message text of the notification |
| `dismissDelay` | `TimeInterval?` | Time in seconds before the notification auto-dismisses |
| `dismissDirection` | `FlashNotifications.DismissDirection?` | Direction for dismissing the notification (up, down, left, right) |
| `delegate` | `any FlashNotifications.FlashNotificationDelegate?` | Delegate to handle notification tap events |
| `completion` | `(() -> Void)?` | Closure called when the notification is dismissed |

#### Initialization

```swift
public init()
```

### showNotification Method

Displays a notification with the specified configuration.

```swift
public static func showNotification(config: FlashNotifications.FlashNotificationConfig) -> (any FlashNotifications.FlashNotification)?
```

#### Parameters

- `config`: A `FlashNotificationConfig` instance containing all customization options

#### Return Value

Returns an optional `FlashNotification` object if the notification was successfully created, or `nil` if it failed.

#### Example Usage

```swift
let config = FlashNotificationConfig()
config.title = "Welcome"
config.message = "Notification system initialized"
config.backgroundColor = .systemGreen
config.titleTextColor = .white
config.messageTextColor = .white
config.dismissDelay = 3.0

let notification = FlashNotifications.showNotification(config: config)
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
