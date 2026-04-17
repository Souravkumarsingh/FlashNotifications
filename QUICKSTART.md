# Quick Start - Add FlashNotifications to Your Project

## Fastest Way (2 minutes)

### Using Xcode UI
1. **File** → **Add Packages...**
2. Paste: `https://github.com/Souravkumarsingh/FlashNotifications.git`
3. Select version: "Up to Next Major" (or specific version like 1.0.1)
4. Choose your target
5. Click **Add Package**
6. Done! Import and use:
   ```swift
   import FlashNotifications
   
   FlashNotificationManager.showNotification(
       type: FlashNotificationManager.success,
       title: "Success",
       message: "It worked!",
       dismissDelay: 3.0
   )
   ```

### Using Package.swift

Add to `dependencies`:
```swift
.package(url: "https://github.com/Souravkumarsingh/FlashNotifications.git", from: "1.0.0")
```

Add to your target:
```swift
.target(
    name: "YourApp",
    dependencies: ["FlashNotifications"]
)
```

Run:
```bash
swift package resolve
```

## Notification Types

### Success
```swift
FlashNotificationManager.showNotification(
    type: FlashNotificationManager.success,
    title: "Success",
    message: "Operation completed",
    dismissDelay: 3.0
)
```

### Error
```swift
FlashNotificationManager.showNotification(
    type: FlashNotificationManager.error,
    title: "Error",
    message: "Something went wrong",
    dismissDelay: 3.0
)
```

### Info
```swift
FlashNotificationManager.showNotification(
    type: FlashNotificationManager.info,
    title: "Info",
    message: "Here's some info",
    dismissDelay: 3.0
)
```

### Custom
```swift
FlashNotificationManager.showNotification(
    textColor: .white,
    backgroundColor: .systemBlue,
    image: UIImage(systemName: "star.fill"),
    title: "Custom",
    message: "Your message",
    dismissDelay: 2.5
)
```

## Common Issues

| Issue | Solution |
|-------|----------|
| **"GitHub login required"** | Sign into GitHub in Xcode Settings → Accounts. See README for details. |
| **"404 Not Found"** | Ensure you're using the correct repo URL. See SPM_ERRORS.md for help. |
| **"Package not found"** | Clear cache: `rm -rf ~/.swiftpm` and try again. |
| **Framework not found at runtime** | Make sure the target's Build Phases include FlashNotifications in Link Binary With Libraries. |

## Documentation

- **README.md** - Full documentation and troubleshooting
- **SPM_ERRORS.md** - Error reference with solutions
- **RELEASE_GUIDE.md** - For maintainers releasing new versions
- **SETUP_COMPLETE.md** - Complete setup overview

## Requirements

- iOS 13.0 or later
- Swift 5.9+
- Xcode 14+

## Support

Encountering an issue? Check:
1. [README.md](README.md) - Troubleshooting section
2. [SPM_ERRORS.md](SPM_ERRORS.md) - Error reference
3. [GitHub Issues](https://github.com/Souravkumarsingh/FlashNotifications/issues)

---

Happy notifying! 🎉
