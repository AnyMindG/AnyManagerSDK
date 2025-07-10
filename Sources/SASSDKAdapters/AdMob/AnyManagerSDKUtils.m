//
//  AnyManagerAdUtils.m
//  AnyManagerSDKDemoApp
//
//  Created by Narender on 04/06/25.
//

#import <Foundation/Foundation.h>
#import "AnyManagerSDKUtils.h"

// Implementation file
@implementation AnyManagerSDKUtils

+ (void)launchAdInspector:(UIViewController *)viewController
          completion:(void(^)(NSError * _Nullable error))completion {

    [GADMobileAds.sharedInstance presentAdInspectorFromViewController:viewController
                                                    completionHandler:^(NSError * _Nullable error) {
        if (error) {
            // Log the error and call the completion handler with the error
            NSLog(@"Failed to present Ad Inspector: %@", error.localizedDescription);
            if (completion) {
                completion(error);  // Pass the error to the caller
            }
        } else {
            // Log success and call the completion handler with nil (no error)
            NSLog(@"Ad Inspector was shown successfully.");
            if (completion) {
                completion(nil);  // No error, pass nil
            }
        }
    }];
}

+ (void)enableGMATestMode:(NSArray *)testDeviceIdentifiers {
    
    GADMobileAds.sharedInstance.requestConfiguration.testDeviceIdentifiers = testDeviceIdentifiers;

}

@end


