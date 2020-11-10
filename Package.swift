// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "SyncKit",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v10),
        .tvOS(.v10),
        .watchOS(.v3)
    ],
    products: [
        .library(name: "SyncKit", targets: ["SyncKit"])],
    dependencies: [
        .package(url: "https://github.com/realm/realm-cocoa", from: "4.1.1")
    ],
    targets: [
        .target(
            name: "SyncKit/Core",
            dependencies: [],
            path: ".",
            sources: ["SyncKit/Classes/QSSynchronizer"]
        ),
        .target(
            name: "SyncKit/CoreData",
            dependencies: ["SyncKit/Core"],
            path: ".",
            sources: ["SyncKit/Classes/CoreData"]
        ),
         .target(
            name: "SyncKit/Realm",
            dependencies: ["Realm", "SyncKit/Core"],
            path: ".",
            sources: ["SyncKit/Classes/Realm"]
        ),
        .target(
            name: "SyncKit/RealmSwift",
            dependencies: ["RealmSwift", "Realm", "SyncKit/Core"],
            path: ".",
            sources: ["SyncKit/Classes/RealmSwift"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
