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
            checksum: "41bed17deb3c47286c78ebf88614b9f2cffa074df329b7fa9cf16dcaf1350f79"
        )
    ]
)
