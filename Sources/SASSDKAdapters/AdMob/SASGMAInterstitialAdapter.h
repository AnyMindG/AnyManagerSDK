//
//  SASGMAInterstitialAdapter.h
//  AnyManagerSDKDemoApp
//
//  Created by Narender on 28/05/25.
//

#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <SASDisplayKit/SASDisplayKit.h>
#import "SASGMAAdNetworkExtras.h"

NS_ASSUME_NONNULL_BEGIN

@interface SASGMAInterstitialAdapter : NSObject <GADMediationAdapter, GADMediationInterstitialAd, SASInterstitialManagerDelegate>

@property (nonatomic, strong) SASInterstitialManager *interstitialManager;
@property (nonatomic, copy) GADMediationInterstitialLoadCompletionHandler loadCompletionHandler;
@property (nonatomic, weak) id<GADMediationInterstitialAdEventDelegate> delegate;

+ (GADVersionNumber)adapterVersion;
+ (GADVersionNumber)adSDKVersion;
+ (nullable Class<GADAdNetworkExtras>)networkExtrasClass;

- (void)loadInterstitialForAdConfiguration:(GADMediationInterstitialAdConfiguration *)adConfiguration
                        completionHandler:(GADMediationInterstitialLoadCompletionHandler)completionHandler;

- (void)presentFromViewController:(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END

