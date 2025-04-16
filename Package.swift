// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// v1.13.0
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
        .package(url: "https://github.com/AnyMindG/AdSDKs.git", from: "1.8.0"),
        .package(url: "https://github.com/AnyMindG/OguryMediationGoogleMobileAds.git", from: "1.0.0"),
        .package(url: "https://github.com/AnyMindG/GoogleMobileAdsMediationMintegral.git", from: "1.1.0"),
        .package(url: "https://github.com/AnyMindG/IASDKCore.git", from: "1.3.0"),
        .package(url: "https://github.com/AnyMindG/GoogleMobileAdsMediationFyber.git", from: "1.3.0"),
        .package(url: "https://github.com/AnyMindG/InMobiAdSDK.git", from: "1.1.0"),
        .package(url: "https://github.com/AnyMindG/GoogleMobileAdsMediationInMobi.git", from: "1.2.0"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", from: "11.13.0"),
    ],
    targets: [
        .target(
            name: "AnyManagerSDK",
            dependencies: [
                .product(name: "MTGSDK", package: "AdSDKs"),
                .product(name: "MTGSDKBanner", package: "AdSDKs"),
                .product(name: "MTGSDKBidding", package: "AdSDKs"),
                .product(name: "MTGSDKInterstitialVideo", package: "AdSDKs"),
                .product(name: "MTGSDKNativeAdvanced", package: "AdSDKs"),
                .product(name: "MTGSDKNewInterstitial", package: "AdSDKs"),
                .product(name: "MTGSDKReward", package: "AdSDKs"),
                .product(name: "MTGSDKSplash", package: "AdSDKs"),
                .product(name: "GoogleMobileAdsMediationMintegral", package: "GoogleMobileAdsMediationMintegral"),
                
                .product(name: "AppLovinSDK", package: "AdSDKs"),
                .product(name: "GoogleMobileAdsMediationAppLovin", package: "AdSDKs"),
                .product(name: "VungleAds", package: "AdSDKs"),
                .product(name: "GoogleMobileAdsMediationVungle", package: "AdSDKs"),
                
                .product(name: "OguryAds", package: "AdSDKs"),
                .product(name: "OMSDK_Ogury", package: "AdSDKs"),
                .product(name: "OguryCore", package: "AdSDKs"),
                .product(name: "OgurySdk", package: "AdSDKs"),
                .product(name: "OguryMediationGoogleMobileAds", package: "OguryMediationGoogleMobileAds"),
                
                .product(name: "ChartboostSDK", package: "AdSDKs"),
                .product(name: "GoogleMobileAdsMediationChartboost", package: "AdSDKs"),
                
                .product(name: "IASDKCore", package: "IASDKCore"),
                .product(name: "GoogleMobileAdsMediationFyber", package: "GoogleMobileAdsMediationFyber"),
                
                .product(name: "InMobiAdSDK", package: "InMobiAdSDK"),
                .product(name: "GoogleMobileAdsMediationInMobi", package: "GoogleMobileAdsMediationInMobi"),
                
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
