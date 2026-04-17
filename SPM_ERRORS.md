# SPM Integration Errors - Quick Reference

## Error: "failed downloading ... badResponseStatusCode(404)"

### What This Means
Swift Package Manager tried to download the binary XCframework from the release asset URL, but got an **HTTP 404 (Not Found)** response.

### Most Likely Causes

1. **Wrong Repository Name** (Most Common)
   - Error mentions: `FlashNotificationsSource` instead of `FlashNotifications`
   - **Fix:** Use the correct repo: `https://github.com/Souravkumarsingh/FlashNotifications.git`
   - Verify you're not using an old fork or moved repo

2. **Release Doesn't Have Binary Attached**
   - The git tag exists, but the GitHub release wasn't created or doesn't have the ZIP file
   - **Fix:** Create the release and attach the binary:
     ```bash
     gh release create v1.0.1 build/FlashNotifications.xcframework.zip
     ```

3. **Wrong Version in Package.swift**
   - The binary target URL references a version that doesn't exist
   - **Fix:** Ensure the release URL and tag match:
     ```swift
     url: "https://github.com/.../releases/download/v1.0.1/FlashNotifications.xcframework.zip"
     // Version must match tag: v1.0.1
     ```

4. **Release Asset URL is Incorrect**
   - Check the exact URL format (case-sensitive, correct filename)
   - **Fix:** Verify on GitHub: https://github.com/Souravkumarsingh/FlashNotifications/releases

## Error: "unexpectedly did not find the new dependency in the package graph"

### What This Means
SPM completed the download but couldn't find the package in the resolved graph. Usually preceded by the 404 error above.

### Fix
Resolve the 404 error (see above), then clear the cache and retry:
```bash
rm -rf ~/Library/Developer/Xcode/DerivedData
rm -rf ~/.swiftpm
# Try adding the package again
```

## Error: "checksum of downloaded artifact does not match"

### What This Means
The binary ZIP's checksum doesn't match the one specified in `Package.swift`.

### Most Likely Causes

1. **Checksum in Package.swift is Wrong**
   - The binary has the correct content, but the manifest has outdated checksum
   - **Fix:** Recompute and update:
     ```bash
     swift package compute-checksum build/FlashNotifications.xcframework.zip
     # Update Package.swift with the result
     ```

2. **Binary Was Replaced/Regenerated**
   - You rebuilt the binary but didn't update the checksum
   - **Fix:** Update the checksum and re-release (see above)

## Error: "badResponseStatusCode(401)" or Login Prompt

### What This Means
SPM needs credentials to access the resource (usually Git operations for private repos).

### Fix for Public Repos
1. Ensure the repository is actually public
2. Sign into GitHub in Xcode (Xcode → Settings → Accounts → Add GitHub account)
3. Clear cache: `rm -rf ~/.swiftpm`
4. Retry

### Note on Private Repos
If using a private repo, users must:
- Have GitHub account credentials in Xcode
- Or configure SSH keys: `ssh-keygen -t ed25519`
- And add the key at https://github.com/settings/keys

## Diagnostic Steps

1. **Verify the package repo exists and is public:**
   ```bash
   git clone https://github.com/Souravkumarsingh/FlashNotifications.git /tmp/test-flash
   # Should clone without asking for credentials
   ```

2. **Check the release exists:**
   ```bash
   curl -I "https://github.com/Souravkumarsingh/FlashNotifications/releases/tag/v1.0.1"
   # Should return HTTP 200 or 302
   ```

3. **Check the binary URL is accessible:**
   ```bash
   curl -I -L "https://github.com/Souravkumarsingh/FlashNotifications/releases/download/v1.0.1/FlashNotifications.xcframework.zip"
   # Should return HTTP 200 after redirects
   ```

4. **Test SPM resolution locally:**
   ```bash
   cd /tmp && rm -rf test-spm
   mkdir test-spm && cd test-spm
   swift package init --type executable
   # Add dependency to Package.swift
   swift package resolve
   ```

## Getting Help

If you encounter issues:
1. Check this guide and the README troubleshooting section
2. Verify your repository URL (case-sensitive)
3. Ensure the GitHub release exists and has the binary attached
4. Clear your local SPM cache
5. Try the diagnostic steps above

## For Framework Maintainers

See [RELEASE_GUIDE.md](RELEASE_GUIDE.md) for how to properly release versions and avoid these errors.
