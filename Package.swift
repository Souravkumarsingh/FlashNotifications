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
            url: "https://github.com/Souravkumarsingh/FlashNotificationsSource/releases/download/v1.0.0/FlashNotifications.xcframework.zip",
            checksum: "879f89b2717ffc841911ce9744474334674336fd911b35ac28a1a85b1398dd0a"
        )
    ]
)
