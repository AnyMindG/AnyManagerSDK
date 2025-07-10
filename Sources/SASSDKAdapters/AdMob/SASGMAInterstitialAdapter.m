//
//  SASGMAInterstitialAdapter.m
//  AnyManagerSDKDemoApp
//
//  Created by Narender on 28/05/25.
//

#import "SASGMAInterstitialAdapter.h"
#import "SASGMAUtils.h"

@implementation SASGMAInterstitialAdapter

- (instancetype)init {
    self = [super init];
    if (self) {
        // Initialization code if needed
    }
    return self;
}

+ (GADVersionNumber)adapterVersion {
    return [SASGMAUtils adapterVersion];
}

+ (GADVersionNumber)adSDKVersion {
    return [SASGMAUtils adSDKVersion];
}

+ (nullable Class<GADAdNetworkExtras>)networkExtrasClass {
    return [SASGMAAdNetworkExtras class];
}

// Adapter lifecycle

- (void)loadInterstitialForAdConfiguration:(GADMediationInterstitialAdConfiguration *)adConfiguration
                        completionHandler:(GADMediationInterstitialLoadCompletionHandler)completionHandler {
    
    SASAdPlacement *placement = [SASGMAUtils placementWithAdConfiguration:adConfiguration];
    
    if (!placement) {
        // Placement is invalid, sending an error
        NSError *error = [NSError errorWithDomain:kSASGMAErrorDomain
                                             code:kSASGMAErrorCodeInvalidServerParameters
                                         userInfo:nil];
        completionHandler(nil, error);
        return;
    }
    
    self.loadCompletionHandler = completionHandler;
    
    // Instantiating the interstitial manager
    self.interstitialManager = [[SASInterstitialManager alloc] initWithPlacement:placement delegate:self];
    
    // Load the interstitial ad
    [self.interstitialManager load];
}

- (void)presentFromViewController:(UIViewController *)viewController {
    if (self.interstitialManager.adStatus == SASAdStatusReady) {
        // Show interstitial ad only if ready
        [self.interstitialManager showFromViewController:viewController];
    }
}

// SASInterstitialManagerDelegate implementation

- (void)interstitialManager:(SASInterstitialManager *)manager didLoadAd:(SASAd *)ad {
    self.delegate = self.loadCompletionHandler(self, nil);
}

- (void)interstitialManager:(SASInterstitialManager *)manager didFailToLoadWithError:(NSError *)error {
    self.loadCompletionHandler(nil, error);
}

- (void)interstitialManager:(SASInterstitialManager *)manager didAppearFromViewController:(UIViewController *)viewController {
    [self.delegate willPresentFullScreenView];
    [self.delegate reportImpression];
}

- (void)interstitialManager:(SASInterstitialManager *)manager didDisappearFromViewController:(UIViewController *)viewController {
    [self.delegate willDismissFullScreenView];
}

- (void)interstitialManager:(SASInterstitialManager *)manager didClickWithURL:(NSURL *)URL {
    [self.delegate reportClick];
}

@end

