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
            checksum: "709b2e4e5430856d549eb0c6fa2d7db7c95223d5c7d1a971ee04e0635edc780a"
        )
    ]
)
