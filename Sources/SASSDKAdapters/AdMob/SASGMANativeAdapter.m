//
//  SASGMANativeAdapter.m
//  AnyManagerSDKDemoApp
//
//  Created by Narender on 28/05/25.
//

// SASGMANativeAdapter.m
#import "SASGMANativeAdapter.h"
#import "SASMediatedNativeAd.h"
#import "SASGMAUtils.h"

@implementation SASGMANativeAdapter

- (instancetype)init {
    self = [super init];
    if (self) {
        _loadCompletionHandler = nil;
        _delegate = nil;
        _nativeAdManager = nil;
        _nativeAd = nil;
        _mediatedNativeAd = nil;
    }
    return self;
}

+ (GADVersionNumber)adapterVersion {
    return [SASGMAUtils adapterVersion];
}

+ (GADVersionNumber)adSDKVersion {
    return [SASGMAUtils adSDKVersion];
}

+ (Class<GADAdNetworkExtras>)networkExtrasClass {
    return [SASGMAAdNetworkExtras class];
}

- (void)loadNativeAdForAdConfiguration:(GADMediationNativeAdConfiguration *)adConfiguration
                     completionHandler:(GADMediationNativeLoadCompletionHandler)completionHandler {

    SASAdPlacement *placement = [SASGMAUtils placementWithAdConfiguration:adConfiguration];
    if (!placement) {
        NSError *error = [NSError errorWithDomain:@"SASGMAErrorDomain"
                                             code:1002
                                         userInfo:nil];
        completionHandler(nil, error);
        return;
    }

    self.loadCompletionHandler = completionHandler;

    self.nativeAdManager = [[SASNativeAdManager alloc] initWithPlacement:placement];
  
    [self.nativeAdManager requestAd:^(SASNativeAd *nativeAd, NSError *error) {
        if (nativeAd) {
            self.mediatedNativeAd = [[SASMediatedNativeAd alloc] initWithNativeAd:nativeAd];
            [self.mediatedNativeAd fetchAssetsIfNeededWithCompletionHandler:^(NSError *error) {
                if (error) {
                    completionHandler(nil, error);
                } else {
                    self.delegate = self.loadCompletionHandler(self.mediatedNativeAd, nil);
                    self.mediatedNativeAd.gadDelegate = self.delegate;
                }
            }];
        } else if (error) {
            completionHandler(nil, error);
        } else {
            NSError *loadError = [NSError errorWithDomain:@"SASGMAErrorDomain"
                                                     code:1003
                                                 userInfo:nil];
            completionHandler(nil, loadError);
        }
    }];
}

@end
