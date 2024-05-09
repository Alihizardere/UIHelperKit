// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIHelperKit",
    platforms: [
      .iOS(.v13)
    ],
    products: [
        .library(
            name: "UIHelperKit",
            targets: ["UIHelperKit"]),
    ],
    targets: [
        .target(
            name: "UIHelperKit"),
    ]
)
 
