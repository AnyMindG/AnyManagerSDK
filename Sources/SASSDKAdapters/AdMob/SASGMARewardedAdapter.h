//
//  SASGMARewardedAdapter.h
//  AnyManagerSDKDemoApp
//
//  Created by Narender on 28/05/25.
//

#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <SASDisplayKit/SASDisplayKit.h>
#import "SASGMAAdNetworkExtras.h"

NS_ASSUME_NONNULL_BEGIN

@interface SASGMARewardedAdapter : NSObject <GADMediationAdapter, GADMediationRewardedAd, SASRewardedVideoManagerDelegate>

- (void)loadRewardedAdForAdConfiguration:(GADMediationRewardedAdConfiguration *)adConfiguration
                       completionHandler:(GADMediationRewardedLoadCompletionHandler)completionHandler;

- (void)loadRewardedInterstitialAdForAdConfiguration:(GADMediationRewardedAdConfiguration *)adConfiguration
                                  completionHandler:(GADMediationRewardedLoadCompletionHandler)completionHandler;

- (void)presentFromViewController:(UIViewController *)viewController;

+ (GADVersionNumber)adapterVersion;
+ (GADVersionNumber)adSDKVersion;
+ (nullable Class<GADAdNetworkExtras>)networkExtrasClass;

@end

NS_ASSUME_NONNULL_END

