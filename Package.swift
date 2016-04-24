import PackageDescription

let package = Package(
    name: "Flights",
    dependencies: [
        .Package(url: "https://github.com/onevcat/Rainbow",
                 majorVersion: 1),
    ]
)