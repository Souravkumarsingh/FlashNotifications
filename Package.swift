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
            checksum: "dfe8498a03d3a26568bd71054f5f48577f10e320df2d6fd4fde129e8438b0649"
        )
    ]
)
