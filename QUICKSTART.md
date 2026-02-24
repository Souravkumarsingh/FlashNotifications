# Quick Start: Using FlashNotifications SPM

## Status ✅
Your SPM package is now **live on GitHub** and ready to use!

**Repository:** https://github.com/Souravkumarsingh/FlashNotifications.git

---

## 🚀 Quick Setup (2 Minutes)

### For Existing iOS App Projects (Xcode)

```
1. File → Add Packages...
2. Paste: https://github.com/Souravkumarsingh/FlashNotifications.git
3. Select version (Up to Next Major)
4. Choose your target
5. Click Add Package
```

### For SPM Packages

Add to your `Package.swift`:
```swift
dependencies: [
    .package(url: "https://github.com/Souravkumarsingh/FlashNotifications.git", from: "1.0.0")
]
```

Then add to your target:
```swift
.target(
    name: "YourTarget",
    dependencies: ["FlashNotifications"]
)
```

---

## 💻 Basic Usage

### Import
```swift
import FlashNotifications
```

### Show Success
```swift
FlashNotificationManager.showNotification(
    type: FlashNotificationManager.success,
    title: "Success",
    message: "Operation completed!",
    dismissDelay: 3.0
)
```

### Show Error
```swift
FlashNotificationManager.showNotification(
    type: FlashNotificationManager.error,
    title: "Error",
    message: "Something went wrong",
    dismissDelay: 3.0
)
```

### Show Info
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

---

## 📚 Full Documentation

- **Integration Guide:** See `INTEGRATION.md` in the repository
- **README:** https://github.com/Souravkumarsingh/FlashNotifications
- **Source Code:** `/FlashNotifications/Classes/`

---

## ✨ Features

✅ Pre-configured Success, Error, Info styles  
✅ Custom color and image support  
✅ Automatic dismissal with configurable delay  
✅ Tap handling with delegate support  
✅ Smooth animations  
✅ iOS 13.0+ support  
✅ SwiftUI & UIKit compatible  

---

## 🔧 What's been Done

✅ Created `Package.swift` manifest  
✅ Updated `README.md` with SPM instructions  
✅ Created `INTEGRATION.md` with comprehensive guide  
✅ Added `.gitignore` for SPM artifacts  
✅ Committed and pushed to GitHub  

---

## 📋 GitHub Actions (Optional)

To add CI/CD, create `.github/workflows/test.yml`:

```yaml
name: Swift Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v3
      - name: Build
        run: swift build
      - name: Run Tests
        run: swift test
```

---

## 🎯 Next Steps

1. **Test in your project**: Follow the Quick Setup steps above
2. **Create releases**: Tag versions when ready
   ```bash
   git tag -a v1.0.0 -m "Initial release"
   git push origin v1.0.0
   ```
3. **Add documentation**: Update README as needed
4. **Monitor usage**: Track GitHub stars and issues

---

## 📞 Support

- Issues: https://github.com/Souravkumarsingh/FlashNotifications/issues
- Discussions: https://github.com/Souravkumarsingh/FlashNotifications/discussions
