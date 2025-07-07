// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// v1.18.0
let package = Package(
    name: "AnyManagerSDK",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "AnyManagerSDK",
            targets: ["AnyManagerSDK"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/AnyMindG/AdSDKs.git", from: "1.13.0"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", from: "11.13.0"),
        
    ],
    targets: [
        .target(
            name: "AnyManagerSDK",
            dependencies: [
                .product(name: "AnyManagerMediation", package: "AdSDKs"),
                .product(name: "AppLovinSDK", package: "AdSDKs"),
                .product(name: "GoogleMobileAdsMediationAppLovin", package: "AdSDKs"),
                .product(name: "IASDKCore", package: "AdSDKs"),
                .product(name: "GoogleMobileAdsMediationFyber", package: "AdSDKs"),
                .product(name: "UnityAds", package: "AdSDKs"),
                .product(name: "GoogleMobileAdsMediationUnity", package: "AdSDKs"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                ],
            linkerSettings: [
                .linkedFramework("WebKit"),
                .linkedFramework("AdSupport"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("StoreKit"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("UIKit"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CFNetwork"),
                .linkedFramework("MediaPlayer"),
                .linkedFramework("QuartzCore"),
                
            ]
        ),
        .testTarget(
            name: "AnyManagerSDKTests",
            dependencies: ["AnyManagerSDK"]
        ),
    ]
)
