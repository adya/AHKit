// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AHKit",
    platforms: [.iOS(.v9)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "AHFoundation", targets: ["AHFoundation"]),
        .library(name: "AHLog", targets: ["AHLog"]),
        .library(name: "AHStorage", targets: ["AHStorage"]),
        .library(name: "AHUI", targets: ["AHUI"]),
        .library(name: "AHValidation", targets: ["AHValidation"]),
        .library(name: "AHNetworking", targets: ["AHNetworking"]),
        .library(name: "AHNetworkingAlamofire", targets: ["AHNetworking", "AHNetworkingAlamofire"]),
        .library(name: "AHStomp", targets: ["AHStomp"]),
        .library(name: "AHInjection", targets: ["AHInjection"]),
        .library(name: "AHKit", targets: ["AHFoundation", "AHLog", "AHStorage", "AHUI", "AHValidation", "AHNetworking", "AHInjection"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/daltoniam/Starscream.git", .upToNextMajor(from: "4.0.0")),
    ],
    targets: [
        .target(name: "AHFoundation", dependencies: ["AHObjCBridging"]),
        .target(name: "AHObjCBridging", dependencies: []),
       
        .target(name: "AHLog", dependencies: ["AHFoundation"]),
        .target(name: "AHStorage", dependencies: ["AHFoundation"]),
       
        .target(name: "AHUI", dependencies: ["AHFoundation"], exclude: ["WIP"]),
       
        .target(name: "AHSystem", dependencies: ["AHFoundation"]),
        .target(name: "AHInjection", dependencies: ["AHFoundation", "AHLog"]),
       
        .target(name: "AHValidation", dependencies: ["AHFoundation"]),
       
        .target(name: "AHNetworking", dependencies: ["AHFoundation"]),
        .target(name: "AHNetworkingAlamofire", dependencies: ["AHNetworking", "Alamofire", "AHFoundation", "AHLog", "AHInjection"]),
        
        .target(name: "AHStomp", dependencies: ["AHFoundation", "Starscream"]),
        
        
        .testTarget(name: "AHFoundationTests", dependencies: ["AHFoundation"]),
        .testTarget(name: "AHStorageTests", dependencies: ["AHStorage"]),
        .testTarget(name: "AHLogTests", dependencies: ["AHLog"]),
        .testTarget(name: "AHStompTests", dependencies: ["AHStomp"]),
    ],
    swiftLanguageVersions: [.version("5.3")]
)
