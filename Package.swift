// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CocoaUI",
    platforms: [ .iOS(.v11)],
    products: [
        .library(
            name: "CocoaUI",
            targets: ["CocoaUI"]),
    ],
    dependencies: [
         .package(url: "https://github.com/prashantLalShrestha/LocalizeX.git", from: "1.0.0"),
         .package(url: "https://github.com/prashantLalShrestha/DeviceX.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "CocoaUI",
            dependencies: ["LocalizeX", "DeviceX"],
            path: "Sources"),
        .testTarget(
            name: "CocoaUITests",
            dependencies: ["CocoaUI", "LocalizeX", "DeviceX"],
            path: "CocoaUITests"),
    ]
)
