// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapProbe",
    platforms: [.iOS("17.2")],
    products: [
        // xtool: exactly one library product = the app.
        .library(name: "CapProbe", targets: ["CapProbe"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", exact: "8.4.1"),
        .package(path: "node_modules/@capacitor/filesystem"),
        .package(path: "node_modules/@capacitor/share"),
    ],
    targets: [
        .target(
            name: "CapProbe",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm"),
                .product(name: "CapacitorFilesystem", package: "filesystem"),
                .product(name: "CapacitorShare", package: "share"),
            ]
        ),
    ]
)
