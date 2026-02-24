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
            url: "https://github.com/Souravkumarsingh/FlashNotifications/releases/download/v1.0.1/FlashNotifications.xcframework.zip",
            checksum: "12c82a69835a18610abd705eda265f6caa61982aa21b6ee75592b36a287abb56"
        )
    ]
)
