// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PrepNetworkController",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PrepNetworkController",
            targets: ["PrepNetworkController"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pxlshpr/PrepDataTypes", from: "0.0.9"),
        .package(url: "https://github.com/pxlshpr/SwiftSugar", from: "0.0.74"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "PrepNetworkController",
            dependencies: [
                .product(name: "PrepDataTypes", package: "prepdatatypes"),
                .product(name: "SwiftSugar", package: "swiftsugar"),
            ]),
        .testTarget(
            name: "PrepNetworkControllerTests",
            dependencies: ["PrepNetworkController"]),
    ]
)
