// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RDAO",
    platforms: [.iOS(.v11)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "RDAO",
            targets: ["RDAO"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
//        .package(
//            name: "RealmDatabase",
//            url: "https://github.com/realm/realm-core",
//            revision: "v11.0.4"
//        )
        .package(name: "Realm", url: "https://github.com/realm/realm-cocoa.git", revision: "v10.9.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "RDAO",
            dependencies: [
//                .product(
//                    name: "RealmCore",
//                    package: "RealmDatabase"
//                )
                .product(name: "RealmSwift", package: "Realm")
            ]
        ),
        .testTarget(
            name: "RDAOTests",
            dependencies: ["RDAO"]),
    ]
)
