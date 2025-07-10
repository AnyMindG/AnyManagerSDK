//
//  SASGMAUtils.m
//  AnyManagerSDKDemoApp
//
//  Created by Narender on 28/05/25.
//

#import "SASGMAUtils.h"
#import <SASDisplayKit/SASConfiguration.h>

NSString * const kSASGMAErrorDomain = @"kSASGMAErrorDomain";
const NSInteger kSASGMAErrorCodeInvalidServerParameters = 100;
const NSInteger kSASGMAErrorCodeCannotFetchNativeAdAssets = 101;
const NSInteger kSASGMAErrorCodeFailToLoadNativeAd = 102;

@implementation SASGMAUtils

+ (GADVersionNumber)adapterVersion {
    return (GADVersionNumber){3, 0, 0}; // Equivalent to GADVersionNumber.init(majorVersion: 3, minorVersion: 0, patchVersion: 0)
}

+ (GADVersionNumber)adSDKVersion {
   
    NSString *frameworkVersion = [[SASFrameworkInfo sharedInstance] frameworkVersionString];
    NSArray *versions = [frameworkVersion componentsSeparatedByString:@"."];
    if (versions.count == 3) {
        NSInteger major = [versions[0] integerValue] ?: 7;
        NSInteger minor = [versions[1] integerValue] ?: 0;
        NSInteger patch = [versions[2] integerValue] ?: 0;
        return (GADVersionNumber){major, minor, patch};
    }
    return (GADVersionNumber){7, 0, 0}; // Default to version 7.0.0
}

+ (nullable SASAdPlacement *)placementWithAdConfiguration:(GADMediationAdConfiguration *)adConfiguration {
    NSString *parameter = adConfiguration.credentials.settings[@"parameter"];
    if (!parameter) {
        return nil;
    }

    NSArray *stringComponents = [parameter componentsSeparatedByString:@"/"];
    if (stringComponents.count < 3) {
        return nil;
    }

    NSInteger siteId = [stringComponents[0] integerValue];
    NSString *pageId = stringComponents[1];
    NSInteger formatId = [stringComponents[2] integerValue];

    if (siteId == 0 || pageId.length == 0 || formatId == 0) {
        return nil;
    }

    NSString *targetingString = nil;
    if ([adConfiguration.extras isKindOfClass:[SASGMAAdNetworkExtras class]]) {
        SASGMAAdNetworkExtras *extras = (SASGMAAdNetworkExtras *)adConfiguration.extras;
        targetingString = [extras.keywords componentsJoinedByString:@";"];
    }

    [[SASConfiguration sharedInstance] configureWithSiteId:siteId];
    [[SASConfiguration sharedInstance] secondaryImplementationInfo];


    return [[SASAdPlacement alloc] initWithSiteId:siteId pageName:pageId formatId:formatId keywordTargeting:targetingString];
}

@end

