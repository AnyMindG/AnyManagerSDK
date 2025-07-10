//
//  AnyManagerAdUtils.h
//  AnyManagerSDKDemoApp
//
//  Created by Narender on 04/06/25.
//

#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>

NS_ASSUME_NONNULL_BEGIN

@interface AnyManagerSDKUtils : NSObject

// Public class method with a completion handler
+ (void)launchAdInspector:(UIViewController *)viewController
          completion:(void(^)(NSError * _Nullable error))completion;

+ (void)enableGMATestMode:(NSArray *)testDeviceIdentifiers;

@end

NS_ASSUME_NONNULL_END
