# Binary Distribution Guide

This document explains how to distribute FlashNotifications as a binary framework without exposing source code.

## Current Setup

FlashNotifications is now configured as a **binary SPM package** that distributes only the pre-compiled XCframework.

### What's Included

- **XCframework Bundle**: Pre-compiled framework with support for:
  - iOS devices (arm64)
  - iOS Simulator (arm64, x86_64)
- **No Source Code**: Users only get the compiled binary
- **Fast Integration**: No compilation step required

---

## Option 1: Local Binary Distribution (Current)

The XCframework is stored in the `build/FlashNotifications.xcframework` directory.

### Package.swift Configuration:

```swift
.binaryTarget(
    name: "FlashNotifications",
    path: "build/FlashNotifications.xcframework"
)
```

### Usage:
1. Users clone the repository
2. They add it as a local package or via GitHub
3. SPM automatically uses the pre-built binary

---

## Option 2: GitHub Releases Distribution (Recommended)

To make the binary downloadable without cloning the entire repository:

### Step 1: Create a GitHub Release

```bash
# Create a tag for the version
git tag -a v1.0.0 -m "Release FlashNotifications v1.0.0"

# Push the tag
git push origin v1.0.0
```

### Step 2: Upload XCframework to Release

1. Go to: https://github.com/Souravkumarsingh/FlashNotifications/releases
2. Click "Create a new release"
3. Enter tag: `v1.0.0`
4. Upload the XCframework as a zip file:
   ```bash
   cd build
   zip -r FlashNotifications.xcframework.zip FlashNotifications.xcframework/
   ```
5. Attach the zip file to the release

### Step 3: Update Package.swift for Remote Binary

Once hosted on GitHub Releases, update Package.swift:

```swift
// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "FlashNotifications",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "FlashNotifications",
            targets: ["FlashNotifications"]
        )
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "FlashNotifications",
            url: "https://github.com/Souravkumarsingh/FlashNotifications/releases/download/v1.0.0/FlashNotifications.xcframework.zip",
            checksum: "YOUR_CHECKSUM_HERE"
        )
    ]
)
```

### Step 4: Calculate Checksum

```bash
# Generate the checksum of the zip file
shasum -a 256 build/FlashNotifications.xcframework.zip
```

Copy the output and update the checksum in Package.swift.

---

## Option 3: CocoaPods Distribution

If you also want to support CocoaPods:

### Create Podspec

```ruby
Pod::Spec.new do |spec|
  spec.name         = "FlashNotifications"
  spec.version      = "1.0.0"
  spec.summary      = "A lightweight iOS notification framework"
  spec.homepage     = "https://github.com/Souravkumarsingh/FlashNotifications"
  spec.license      = { :type => "MIT" }
  spec.author       = { "Sourav Singh" => "your.email@example.com" }
  spec.platform     = :ios, "13.0"
  
  spec.source       = { :git => "https://github.com/Souravkumarsingh/FlashNotifications.git", :tag => "#{spec.version}" }
  
  spec.vendored_frameworks = "build/FlashNotifications.xcframework"
  spec.requires_arc = true
end
```

### Publish to CocoaPods

```bash
# Validate the podspec
pod spec lint FlashNotifications.podspec

# Push to CocoaPods trunk
pod trunk push FlashNotifications.podspec
```

---

## Rebuilding the Binary

When you make updates to the source code, regenerate the XCframework:

### Quick Build Script

```bash
#!/bin/bash

# Remove old builds
rm -rf build/FlashNotifications-*.xcarchive build/FlashNotifications.xcframework

# Build for iOS device
xcodebuild archive \
    -scheme FlashNotifications \
    -archivePath build/FlashNotifications-iOS.xcarchive \
    -sdk iphoneos \
    -configuration Release \
    SKIP_INSTALL=NO

# Build for iOS Simulator
xcodebuild archive \
    -scheme FlashNotifications \
    -archivePath build/FlashNotifications-Simulator.xcarchive \
    -sdk iphonesimulator \
    -configuration Release \
    SKIP_INSTALL=NO

# Create XCframework from archives
mkdir -p build/FlashNotifications.xcframework
cp -r build/FlashNotifications-iOS.xcarchive/Products/Library/Frameworks/FlashNotifications.framework build/FlashNotifications.xcframework/ios-arm64
cp -r build/FlashNotifications-Simulator.xcarchive/Products/Library/Frameworks/FlashNotifications.framework build/FlashNotifications.xcframework/ios-arm64_x86_64-simulator

echo "✅ XCframework build complete!"
```

Save this as `build.sh` and run:
```bash
chmod +x build.sh
./build.sh
```

---

## Security Benefits

- ✅ **Proprietary Code Protection**: Source code is not visible
- ✅ **Intellectual Property**: Binary is obfuscated
- ✅ **Faster Distribution**: No compilation time for users
- ✅ **Integrity Verification**: Checksum ensures authenticity
- ✅ **Faster CI/CD**: Reduces build times in consuming projects

---

## Troubleshooting

### Checksum Mismatch
If users get a checksum error:
```bash
# Regenerate and update the checksum
shasum -a 256 FlashNotifications.xcframework.zip
```

### Binary Not Loading
- Verify iOS deployment target is 13.0 or higher
- Check that the target is included in Build Phases → Link Binary With Libraries
- Clean build folder and rebuild

### Architecture Issues
- Ensure both arm64 (device) and simulator architectures are included
- Verify with: `lipo -info build/FlashNotifications.xcframework/ios-arm64/FlashNotifications.framework/FlashNotifications`

---

## Versioning Strategy

Follow semantic versioning:

- **Major (1.0.0)**: Breaking changes
- **Minor (1.1.0)**: New features, backward compatible
- **Patch (1.0.1)**: Bug fixes

Tag each release:
```bash
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0
```

---

## Advantages of Binary Distribution

| Aspect | Source SPM | Binary SPM |
|--------|-----------|-----------|
| Build Time | ⏱️ Slower | ⚡ Faster |
| Code Privacy | ❌ No | ✅ Yes |
| Transparency | ✅ Yes | ❌ No |
| Debugging | ✅ Full | ⚠️ Limited |
| Integration | ✅ Simple | ✅ Simple |
| File Size | 📦 Smaller | 📦 Larger |

