// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "Flights",
    dependencies: [
        .package(url: "https://github.com/onevcat/Rainbow.git", from: "4.1.0")
    ],
    targets: [
        .executableTarget(
            name: "Flights",
            dependencies: ["Rainbow"]
        )
    ]
)
