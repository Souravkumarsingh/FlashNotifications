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
    .package(url: "https://github.com/Souravkumarsingh/FlashNotifications.git", from: "1.0.1")
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

## Troubleshooting

### GitHub Login Prompt When Adding Package

If Xcode asks for GitHub login credentials when adding this package:

1. **Clear Xcode's SPM cache:**
   ```bash
   rm -rf ~/Library/Developer/Xcode/DerivedData
   rm -rf ~/.swiftpm
   ```

2. **Sign into GitHub in Xcode (recommended):**
   - Go to Xcode → Settings → Accounts
   - Click **+** → Select GitHub → Sign in with your GitHub account
   - This allows Xcode to authenticate SPM requests automatically

3. **Use the correct repository URL:**
   - Correct: `https://github.com/Souravkumarsingh/FlashNotifications.git`
   - ⚠️ Do NOT use `FlashNotificationsSource` — that's a deprecated/moved repo

4. **Alternative: Use SSH keys** (for developers):
   ```bash
   # Generate SSH key
   ssh-keygen -t ed25519 -C "your.email@example.com"
   
   # Add public key to GitHub (https://github.com/settings/keys)
   pbcopy < ~/.ssh/id_ed25519.pub
   ```

### 404 Error When Fetching Binary

If you see:
```
failed downloading 'https://...FlashNotifications.xcframework.zip': badResponseStatusCode(404)
```

**Root cause:** The release tag doesn't have the binary ZIP file attached.

**Solution:**
1. Ensure the git tag is pushed to GitHub:
   ```bash
   git push origin --tags
   ```

2. Verify the GitHub release exists at:
   `https://github.com/Souravkumarsingh/FlashNotifications/releases/tag/v1.0.1`

3. Confirm the binary ZIP is attached to the release (not just the tag)

4. Verify `Package.swift` specifies the correct version and checksum

### How SPM Resolution Works

When you add FlashNotifications to your project, SPM performs these steps:

1. **Clone the git repository** and checkout the specified version tag
2. **Read Package.swift** from that tag
3. **Download the binary XCframework ZIP** from the release asset URL
4. **Verify the checksum** matches the one in `Package.swift`
5. **Cache the binary** for future use

If any step fails (wrong URL, missing release, mismatched checksum), you'll see an error.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Additional Documentation

- **[QUICKSTART.md](QUICKSTART.md)** - Quick reference guide
- **[INTEGRATION.md](INTEGRATION.md)** - Comprehensive integration examples

