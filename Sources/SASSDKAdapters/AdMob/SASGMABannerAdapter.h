// SASGMABannerAdapter.h
// Adapter for Google Mobile Ad Mediation
//
// Created by Julien Gomez on 01/03/2022.

#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <SASDisplayKit/SASDisplayKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SASGMABannerAdapter : NSObject <GADMediationAdapter, GADMediationBannerAd, SASBannerViewDelegate>

@property (nonatomic, strong) UIView *view;
@property (nonatomic, copy) GADMediationBannerLoadCompletionHandler loadCompletionHandler;
@property (nonatomic, weak) id<GADMediationBannerAdEventDelegate> delegate;

+ (GADVersionNumber)adapterVersion;
+ (GADVersionNumber)adSDKVersion;
+ (nullable Class<GADAdNetworkExtras>)networkExtrasClass;
- (void)loadBannerForAdConfiguration:(GADMediationBannerAdConfiguration *)adConfiguration
                   completionHandler:(GADMediationBannerLoadCompletionHandler)completionHandler;

@end

NS_ASSUME_NONNULL_END
