// swift-tools-version: 5.6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftHomeServerCore",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftHomeServerCore",
            targets: ["SwiftHomeServerCore"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
        .package(url: "https://github.com/u5-03/SwiftHomeCore.git", from: "1.0.0"),
        .package(url: "git@github.com:u5-03/SwiftHomeCredentials.git", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftHomeServerCore",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "Vapor", package: "vapor"),
                .product(name: "SwiftHomeCredentials", package: "SwiftHomeCredentials"),
                .product(name: "SwiftHomeCore", package: "SwiftHomeCore"),
            ]),
        .testTarget(
            name: "SwiftHomeServerCoreTests",
            dependencies: ["SwiftHomeServerCore"]),
    ]
)
