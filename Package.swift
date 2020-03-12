// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "QGrid",
    platforms: [
      .iOS(.v13),
      .macOS(.v10_15),
      .tvOS(.v13)
    ],
    products: [
        .library(
            name: "QGrid",
            targets: ["QGrid"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "QGrid",
            dependencies: []),
        .testTarget(
            name: "QGridTests",
            dependencies: ["QGrid"]),
    ]
)
