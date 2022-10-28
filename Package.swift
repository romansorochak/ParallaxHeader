// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ParallaxHeader",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ParallaxHeader",
            targets: ["ParallaxHeader"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ParallaxHeader",
            dependencies: [
            ],
            path: "ParallaxHeader",
            exclude: [
                "Info.plist"
                ]
        ),
        .testTarget(
            name: "ParallaxHeaderTests",
            dependencies: ["ParallaxHeader"],
            path: "ParallaxHeaderTests",
            exclude: ["Info.plist"]
        ),
    ]
)
