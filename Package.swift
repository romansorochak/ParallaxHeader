// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "ParallaxHeader",
    platforms: [.iOS(.v8)],
    products: [.library(name: "ParallaxHeader", targets: ["ParallaxHeader"])],
    targets: [.target(name: "ParallaxHeader", path: "ParallaxHeader")],
    swiftLanguageVersions: [.v4,.v4_2,.v5]
)
