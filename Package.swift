// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "ObjectivePGP",
    products: [
        .library(name: "ObjectivePGP", targets: ["ObjectivePGP"])
    ],
    targets: [ .target(name: "ObjectivePGP",
                       dependencies: [],
                       path: "ObjectivePGP")
    ]
)
