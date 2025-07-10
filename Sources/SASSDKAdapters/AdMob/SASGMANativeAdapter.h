//
//  SASGMANativeAdapter.h
//  AnyManagerSDKDemoApp
//
//  Created by Narender on 28/05/25.
//

// SASGMANativeAdapter.h
#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <SASDisplayKit/SASDisplayKit.h>
#import "SASMediatedNativeAd.h"

@interface SASGMANativeAdapter : NSObject <GADMediationAdapter>

@property (nonatomic, copy) GADMediationNativeLoadCompletionHandler loadCompletionHandler;
@property (nonatomic, weak) id<GADMediationNativeAdEventDelegate> delegate;
@property (nonatomic, strong) SASNativeAdManager *nativeAdManager;
@property (nonatomic, strong) SASNativeAd *nativeAd;
@property (nonatomic, strong) SASMediatedNativeAd *mediatedNativeAd;

- (void)loadNativeAdForAdConfiguration:(GADMediationNativeAdConfiguration *)adConfiguration
                     completionHandler:(GADMediationNativeLoadCompletionHandler)completionHandler;

@end


