// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ChronoFlow",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "ChronoFlowKit", targets: ["ChronoFlowKit"]),
        .executable(name: "ChronoFlowApp", targets: ["ChronoFlowApp"])
    ],
    targets: [
        .target(
            name: "ChronoFlowKit",
            dependencies: [],
            resources: [
                .process("Resources/Models.bundle"),
                .process("Resources/Themes")
            ]
        ),
        .executableTarget(
            name: "ChronoFlowApp",
            dependencies: ["ChronoFlowKit"],
            path: "App"
        )
    ]
)
