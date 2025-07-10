//
//  SASGMAUtils.h
//  AnyManagerSDKDemoApp
//
//  Created by Narender on 28/05/25.
//

#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <SASDisplayKit/SASAdPlacement.h>
#import <SASDisplayKit/SASDisplayKit.h>
#import "SASGMAAdNetworkExtras.h"

NS_ASSUME_NONNULL_BEGIN

@interface SASGMAUtils : NSObject

// Error domain and error codes
extern NSString * const kSASGMAErrorDomain;
extern const NSInteger kSASGMAErrorCodeInvalidServerParameters;
extern const NSInteger kSASGMAErrorCodeCannotFetchNativeAdAssets;
extern const NSInteger kSASGMAErrorCodeFailToLoadNativeAd;

// Methods
+ (GADVersionNumber)adapterVersion;
+ (GADVersionNumber)adSDKVersion;
+ (nullable SASAdPlacement *)placementWithAdConfiguration:(GADMediationAdConfiguration *)adConfiguration;

@end

NS_ASSUME_NONNULL_END

