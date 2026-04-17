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
            url: "https://github.com/Souravkumarsingh/FlashNotifications/releases/download/1.0.0/FlashNotifications.xcframework.zip",
            checksum: "4ff5a2804c35f0f12b3f77ef5e31456c41428117731cca7c07f8f29a3bd6f04a"
        )
    ]
)
