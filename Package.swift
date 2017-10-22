// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Flights",
    dependencies: [
        .package(url: "https://github.com/onevcat/Rainbow.git", from: "3.0.0")
    ],
    targets: [
        .target(
            name: "Flights",
            dependencies: ["Rainbow"])
    ]
)
