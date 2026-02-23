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
        .target(
            name: "FlashNotifications",
            dependencies: [],
            path: "FlashNotifications/Classes",
            linkerSettings: [
                .linkedFramework("UIKit")
            ]
        )
    ]
)
