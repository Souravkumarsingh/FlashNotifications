# 📦 Distribution Guide - FlashNotifications

Your FlashNotifications framework is now available through **both SPM and CocoaPods**!

---

## 🎯 Quick Start

### Option 1: CocoaPods (Recommended for Most Projects)

#### Installation

Add to your `Podfile`:

```ruby
pod 'FlashNotifications', '~> 1.0.0'
```

Then run:
```bash
pod install
```

#### Usage

```swift
import FlashNotifications

// Your code here
```

---

### Option 2: Swift Package Manager (SPM)

#### via Branch (Most Reliable)

Add in Xcode:
1. **File** → **Add Packages...**
2. Enter: `https://github.com/Souravkumarsingh/FlashNotifications.git`
3. Select **Branch**: `main`
4. Click **Add Package**

In `Package.swift`:
```swift
.package(
    url: "https://github.com/Souravkumarsingh/FlashNotifications.git", 
    branch: "main"
)
```

#### Via Specific Commit (if version tag has caching issues)

```swift
.package(
    url: "https://github.com/Souravkumarsingh/FlashNotifications.git", 
    revision: "ee42582"
)
```

---

## 📊 Distribution Overview

| Method | Source | Speed | Code Hidden | Status |
|--------|--------|-------|-------------|--------|
| **CocoaPods** | Pre-built Binary | ⚡ Fast | ✅ Yes | ✅ Published |
| **SPM (Branch)** | Git Repository | ⚡ Fast | ✅ Yes | ✅ Ready |
| **SPM (Version)** | Git Tag | ⚡ Fast | ✅ Yes | ⚠️ Cache Issues |

---

## 🔐 Privacy & Security

### Source Code Protection
- ✅ **Binary Distribution Only** - Source code is NOT included
- ✅ **Compiled Framework** - Pre-built for distribution
- ✅ **Obfuscated** - Binary code is protected

### What Users Get
- Pre-compiled `.xcframework` binary
- No source code access
- No build time (fast integration)
- Professional distribution

---

## 📱 Supported Platforms

- **iOS**: 13.0+
- **Swift**: 5.0+
- **Architecture**: arm64, arm64e, x86_64 (simulator)

---

## 🚀 Publishing Details

### CocoaPods Trunk
- **Pod Name**: `FlashNotifications`
- **Version**: 1.0.0
- **Published On**: April 20, 2026
- **CocoaPods URL**: https://cocoapods.org/pods/FlashNotifications

### GitHub Releases
- **Release**: v1.0.0
- **Binary**: `FlashNotifications.xcframework.zip`
- **Download URL**: https://github.com/Souravkumarsingh/FlashNotifications/releases/download/1.0.0/FlashNotifications.xcframework.zip

---

## 🔄 Future Updates

When you release version 1.1.0:

### For CocoaPods:
```bash
# Update podspec version to 1.1.0
pod trunk push FlashNotifications.podspec --allow-warnings
```

### For SPM:
1. Create GitHub release `1.1.0`
2. Upload binary: `FlashNotifications.xcframework.zip`
3. Users can use: `.package(url: "...", from: "1.1.0")`

---

## ❓ FAQ

### Q: Can users see my source code?
**A:** No! Only the compiled binary is distributed. Source code is hidden.

### Q: Do users need to compile the framework?
**A:** No! CocoaPods provides pre-compiled binaries, SPM downloads them from releases.

### Q: How long does integration take?
**A:** Very fast - just `pod install` or add package dependency. No compilation needed.

### Q: Can I update the code later?
**A:** Yes! Just create a new release (1.1.0, 1.2.0, etc.) and publish via CocoaPods.

### Q: What if users have issues with SPM version tags?
**A:** Advise them to use `branch: "main"` instead - it bypasses SPM's version cache.

---

## 📧 Support

For issues, users should report to:
- GitHub Issues: https://github.com/Souravkumarsingh/FlashNotifications/issues

---

## 📄 License

This framework is distributed under the **MIT License**. See LICENSE file for details.

---

**Published with ❤️ on April 20, 2026**
