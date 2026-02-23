# FlashNotifications Integration Guide

This guide shows you how to use the FlashNotifications SPM package in your iOS projects.

## Repository Information

**Repository URL:** https://github.com/Souravkumarsingh/FlashNotifications.git  
**Minimum iOS:** 13.0  
**Current Version:** main branch (Latest)

---

## Method 1: Add to Xcode Project (Recommended for App Projects)

### Step-by-Step Instructions:

1. **Open Your Project in Xcode**
   - Launch Xcode and open your iOS project

2. **Add Package Dependency**
   - Go to: **File** → **Add Packages...**
   - Or: **Your Project** → **Package Dependencies** tab

3. **Enter Repository URL**
   ```
   https://github.com/Souravkumarsingh/FlashNotifications.git
   ```

4. **Select Version**
   - **Up to Next Major Version** (recommended)
   - Or specify a branch/tag if available

5. **Select Target**
   - Choose which target(s) should use FlashNotifications
   - Click **Add Package**

6. **Verify Installation**
   - Check **YourProject** → **Package Dependencies** in Xcode
   - Should see `FlashNotifications` listed

---

## Method 2: Add to Package.swift (For SPM Packages)

If you're building another SPM package that depends on FlashNotifications:

```swift
// Package.swift
import PackageDescription

let package = Package(
    name: "MyPackage",
    platforms: [
        .iOS(.v13)
    ],
    dependencies: [
        .package(
            url: "https://github.com/Souravkumarsingh/FlashNotifications.git",
            from: "1.0.0"  // Specify version or use branch
        )
    ],
    targets: [
        .target(
            name: "MyPackage",
            dependencies: ["FlashNotifications"]
        )
    ]
)
```

### Using a Specific Branch:
```swift
.package(
    url: "https://github.com/Souravkumarsingh/FlashNotifications.git",
    branch: "main"
)
```

### Using a Specific Version:
```swift
.package(
    url: "https://github.com/Souravkumarsingh/FlashNotifications.git",
    from: "1.0.0"  // Version 1.0.0 or later
)
```

---

## Usage Examples

### Import the Package

```swift
import FlashNotifications
```

### Show a Success Notification

```swift
FlashNotificationManager.showNotification(
    type: FlashNotificationManager.success,
    title: "Success",
    message: "Your operation completed successfully!",
    dismissDelay: 3.0
)
```

### Show an Error Notification

```swift
FlashNotificationManager.showNotification(
    type: FlashNotificationManager.error,
    title: "Error",
    message: "Something went wrong. Please try again.",
    dismissDelay: 3.0
)
```

### Show an Info Notification

```swift
FlashNotificationManager.showNotification(
    type: FlashNotificationManager.info,
    title: "Information",
    message: "This is an informational message.",
    dismissDelay: 2.5
)
```

### Custom Notification with Delegate

```swift
import UIKit
import FlashNotifications

class MyViewController: UIViewController, FlashNotificationDelegate {
    
    func showCustomNotification() {
        FlashNotificationManager.showNotification(
            textColor: .white,
            backgroundColor: .systemBlue,
            image: UIImage(systemName: "star.fill"),
            title: "Custom",
            message: "This is a custom styled notification",
            dismissDelay: 3.0,
            delegate: self
        ) {
            print("Notification dismissed")
        }
    }
    
    // MARK: - FlashNotificationDelegate
    
    func onNotificationTap(
        type: FlashNotificationType,
        title: String?,
        message: String?
    ) {
        print("Notification tapped!")
        print("Title: \(title ?? "N/A")")
        print("Message: \(message ?? "N/A")")
    }
}
```

### With Completion Handler

```swift
FlashNotificationManager.showNotification(
    type: FlashNotificationManager.success,
    title: "Upload Complete",
    message: "File uploaded successfully",
    dismissDelay: 2.5
) {
    print("Notification has been dismissed")
    // Perform any action after notification disappears
}
```

---

## Available Notification Types

### Pre-configured Types

```swift
// Success notification (green)
FlashNotificationManager.success

// Error notification (red)
FlashNotificationManager.error

// Info notification (gray)
FlashNotificationManager.info
```

### Custom Notification

```swift
let customType = FlashNotificationTypeDefinition(
    textColor: UIColor.white,
    backgroundColor: UIColor.systemPurple,
    image: UIImage(systemName: "heart.fill")
)

FlashNotificationManager.showNotification(
    type: customType,
    title: "Custom Style",
    message: "Your message here",
    dismissDelay: 3.0
)
```

---

## Troubleshooting

### Package Not Showing in Xcode

1. **Clean Build Folder**
   - **Product** → **Clean Build Folder** (⌘Shift K)

2. **Resolve Package Dependencies**
   - **File** → **Packages** → **Resolve Package Dependencies**

3. **Restart Xcode**
   - Close and reopen Xcode

### Module Not Found Error

- Ensure the target is added to your build phases
- Go to: **Target Settings** → **Build Phases** → **Link Binary With Libraries**
- Verify `FlashNotifications` is listed

### UIKit Not Available

- Check your deployment target is iOS 13.0 or higher
- Go to: **Target Settings** → **General** → **Minimum Deployments**

---

## Version Management

To update to the latest version:

1. **In Xcode**: **File** → **Packages** → **Update to Latest Package Versions**
2. **Or manually edit** `Package.resolved` if needed

To pin to a specific version, modify the version requirement in your `Package.swift` or Xcode package settings.

---

## Notes

- FlashNotifications is **iOS only** (requires iOS 13.0+)
- The package links `UIKit` framework automatically
- All notifications appear with smooth animations
- Notifications automatically dismiss after the specified delay
- You can tap notifications to trigger the delegate callback

---

## Support

For issues or feature requests, visit:  
https://github.com/Souravkumarsingh/FlashNotifications/issues
