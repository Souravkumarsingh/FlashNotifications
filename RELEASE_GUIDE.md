# Release Guide for FlashNotifications Framework

This guide explains how to properly release a new version of FlashNotifications as an SPM package.

## Release Checklist

### Step 1: Prepare the Code
- [ ] Ensure all changes are committed and tested
- [ ] Update version in `Package.swift` if needed (optional, tag controls the version)
- [ ] Verify `Package.swift` is correct and committed
- [ ] Verify the binary XCframework is built and ready at `build/FlashNotifications.xcframework.zip`

### Step 2: Create a Git Tag
```bash
# Create a new tag (use semantic versioning: v1.0.0, v1.0.1, v2.0.0, etc.)
git tag -a v1.0.1 -m "FlashNotifications v1.0.1 - Release description"

# Or without annotation:
git tag v1.0.1

# Push all tags to GitHub
git push origin --tags
```

### Step 3: Create a GitHub Release
You have two options:

#### Option A: Using GitHub CLI (Recommended)
```bash
# Install GitHub CLI if needed
brew install gh

# Authenticate (one-time)
gh auth login

# Create release with binary attachment
gh release create v1.0.1 build/FlashNotifications.xcframework.zip \
  --title "FlashNotifications v1.0.1" \
  --notes "Release notes here"
```

#### Option B: Using GitHub Web UI
1. Go to https://github.com/Souravkumarsingh/FlashNotifications/releases
2. Click "Create a new release"
3. Select the tag `v1.0.1`
4. Add title: "FlashNotifications v1.0.1"
5. Add release notes
6. Drag and drop the `build/FlashNotifications.xcframework.zip` file
7. Click "Publish release"

### Step 4: Verify the Release

```bash
# Check the release exists
gh release view v1.0.1

# Verify the binary URL is accessible
curl -I -L "https://github.com/Souravkumarsingh/FlashNotifications/releases/download/v1.0.1/FlashNotifications.xcframework.zip"
# Should return HTTP 200 after redirects
```

### Step 5: Update Checksum in Package.swift (If Needed)

If you release a new binary with the same version, compute and update the checksum:

```bash
# Compute the SPM checksum for your binary
swift package compute-checksum build/FlashNotifications.xcframework.zip
# Output: 709b2e4e5430856d549eb0c6fa2d7db7c95223d5c7d1a971ee04e0635edc780a

# Update Package.swift with the new checksum
# Then commit and push
git add Package.swift
git commit -m "Update checksum for v1.0.1"
git push
```

### Step 6: Test the Release

Test that SPM can resolve the package:

```bash
# From a clean directory or fresh clone
cd /tmp
rm -rf test-spm
mkdir test-spm && cd test-spm
swift package init --type executable

# Add your package as a dependency
# Edit Package.swift and add to dependencies:
# .package(url: "https://github.com/Souravkumarsingh/FlashNotifications.git", from: "1.0.1")

# Resolve
swift package resolve --verbose

# Should download the binary without errors
```

## Understanding SPM Resolution

When someone adds your package:

```
Repository Git URL
    ↓
Checkout Version Tag (v1.0.1)
    ↓
Read Package.swift from that tag
    ↓
Download Binary from Release Asset URL
    ↓
Verify Checksum
    ↓
Cache & Use Binary
```

## Common Issues

### Issue: 404 Error When Downloading Binary

**Cause:** Release tag exists but no binary ZIP is attached to the release.

**Fix:**
1. Ensure the GitHub release has the binary ZIP attached
2. Verify the release asset URL is correct: 
   `https://github.com/Souravkumarsingh/FlashNotifications/releases/download/v1.0.1/FlashNotifications.xcframework.zip`

### Issue: Checksum Mismatch

**Cause:** The binary ZIP was modified or regenerated, changing its checksum.

**Fix:**
1. Compute the new checksum:
   ```bash
   swift package compute-checksum build/FlashNotifications.xcframework.zip
   ```
2. Update `Package.swift` with the new checksum
3. Commit and push the updated `Package.swift`

### Issue: GitHub Login Prompt

**Cause:** Users don't have GitHub credentials set up for SPM.

**Solution:** Users should:
1. Clear SPM cache: `rm -rf ~/.swiftpm`
2. Sign into GitHub in Xcode (Xcode → Settings → Accounts)
3. Or configure SSH keys and use SSH-style URLs

## Version Numbering

Use semantic versioning:
- **Major.Minor.Patch** (e.g., 1.0.0, 1.0.1, 2.0.0)
- **Major:** Breaking changes
- **Minor:** New features (backward compatible)
- **Patch:** Bug fixes (backward compatible)

## Release History Example

```bash
v1.0.0  - Initial release
v1.0.1  - Bug fixes
v1.0.2  - More bug fixes
v1.1.0  - New features added
v2.0.0  - Major version with breaking changes
```

## Automation (Optional)

You can automate release creation using GitHub Actions, but for a simple binary framework, manual releases work fine.

## Resources

- [Swift Package Manager Documentation](https://www.swift.org/documentation/package-manager)
- [GitHub Releases Documentation](https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases)
- [Semantic Versioning](https://semver.org/)
