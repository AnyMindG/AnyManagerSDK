Pod::Spec.new do |s|
    s.name              = 'AnyManagerSDK'

    s.version           = '3.2.0'

    s.summary           = 'AnySDK'

    s.homepage          = 'https://github.com/AnyMindG/AnyManagerSDK.git'

    s.author            = { 'Name' => 'plugindev@pokkt.com' }

    s.license           = { :type => 'Apache', :file => 'LICENSE' }

    s.platform          = :ios

    s.source            = { :http => 'https://github.com/AnyMindG/AnyManagerSDK/releases/download/3.2.1.1/AnyManagerSDK.zip'}

    s.source_files = 'AnyManagerSDK/*.{h,m,swift}'

    s.ios.deployment_target = '12.0'

    s.swift_version = ['3', '5', '5.7']

    s.static_framework = true
    
    s.frameworks = "CoreData", "MediaPlayer", "Foundation", "UIKit", "CoreTelephony", "AdSupport", "CoreGraphics", "CoreMotion", "MessageUI", "EventKit", "EventKitUI", "CoreLocation", "AVFoundation", "CFNetwork", "StoreKit", "WebKit", "PassKit" , "AudioToolbox" , "CoreMedia" , "JavaScriptCore" , "CoreServices" , "SafariServices" , "Social" , "AppTrackingTransparency" , "MobileCoreServices"

    s.libraries = "xml2.2", "c++", "xml2" , "z" , "sqlite3" , "z.1.2.5"

    s.ios.framework   = 'SystemConfiguration'


    s.dependency "PersonalizedAdConsent"
    s.dependency "GoogleMobileAdsMediationPokktAds"
    s.dependency "GoogleMobileAdsMediationInMobi"
    s.dependency "GoogleMobileAdsMediationTapjoy"
    s.dependency "GoogleMobileAdsMediationAdColony"
    s.dependency "GoogleMobileAdsMediationAppLovin"
    s.dependency "GoogleMobileAdsMediationFacebook"
    s.dependency "GoogleMobileAdsMediationUnity"
    s.dependency "GoogleMobileAdsMediationIronSource"
    s.dependency "GoogleMobileAdsMediationChartboost"
    s.dependency "GoogleMobileAdsMediationVungle"
    s.dependency "GoogleMobileAdsMediationFyber"
    s.dependency "AmazonPublisherServicesSDK"
    s.dependency "AmazonPublisherServicesAdMobAdapter"
    s.dependency "OguryMediationGoogleMobileAds"
    s.dependency "Smart-Display-SDK"
    s.dependency "MintegralAdSDK/BidNativeAd"
    s.dependency "MintegralAdSDK/BidRewardVideoAd"
    s.dependency "MintegralAdSDK/BidNewInterstitialAd"
    s.dependency "MintegralAdSDK/BidBannerAd"
    s.dependency "GoogleMobileAdsMediationPangle"

end





