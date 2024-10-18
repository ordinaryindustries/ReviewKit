// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ReviewKit",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v10_15), .iOS(.v17), .visionOS(.v1)
    ],
    products: [
        .library(
            name: "ReviewKit",
            targets: ["ReviewKit"]),
    ], dependencies: [
        .package(url: "https://github.com/realm/SwiftLint", branch: "main")
    ],
    targets: [
        .target(
            name: "ReviewKit",
            plugins: [.plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLint")]
        ),
        .testTarget(
            name: "ReviewKitTests",
            dependencies: ["ReviewKit"])
    ]
)
