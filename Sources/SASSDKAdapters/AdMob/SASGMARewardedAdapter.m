//
//  SASGMARewardedAdapter.m
//  AnyManagerSDKDemoApp
//
//  Created by Narender on 28/05/25.
//

#import "SASGMARewardedAdapter.h"
#import "SASGMAUtils.h"

@interface SASGMARewardedAdapter()

@property (nonatomic, strong) SASRewardedVideoManager *rewardedVideoManager;
@property (nonatomic, copy) GADMediationRewardedLoadCompletionHandler loadCompletionHandler;
@property (nonatomic, weak) id<GADMediationRewardedAdEventDelegate> delegate;

@end

@implementation SASGMARewardedAdapter

+ (GADVersionNumber)adapterVersion {
    return [SASGMAUtils adapterVersion];
}

+ (GADVersionNumber)adSDKVersion {
    return [SASGMAUtils adSDKVersion];
}

+ (nullable Class<GADAdNetworkExtras>)networkExtrasClass {
    return [SASGMAAdNetworkExtras class];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)loadRewardedAdForAdConfiguration:(GADMediationRewardedAdConfiguration *)adConfiguration
                       completionHandler:(GADMediationRewardedLoadCompletionHandler)completionHandler {
    
    SASAdPlacement *placement = [SASGMAUtils placementWithAdConfiguration:adConfiguration];
    
    if (!placement) {
        NSError *error = [NSError errorWithDomain:kSASGMAErrorDomain
                                             code:kSASGMAErrorCodeInvalidServerParameters
                                         userInfo:nil];
        completionHandler(nil, error);
        return;
    }
    
    self.loadCompletionHandler = completionHandler;
    
    self.rewardedVideoManager = [[SASRewardedVideoManager alloc] initWithPlacement:placement delegate:self];
    
    // Load the rewarded video ad
    [self.rewardedVideoManager load];
}

- (void)loadRewardedInterstitialAdForAdConfiguration:(GADMediationRewardedAdConfiguration *)adConfiguration
                                  completionHandler:(GADMediationRewardedLoadCompletionHandler)completionHandler {
    [self loadRewardedAdForAdConfiguration:adConfiguration completionHandler:completionHandler];
}

- (void)presentFromViewController:(UIViewController *)viewController {
    if (self.rewardedVideoManager.adStatus == SASAdStatusReady) {
        // Show the rewarded video ad if it's ready
        [self.rewardedVideoManager showFromViewController:viewController];
    }
}

// SASRewardedVideoManagerDelegate Methods

- (void)rewardedVideoManager:(SASRewardedVideoManager *)manager didLoadAd:(SASAd *)ad {
    self.delegate = self.loadCompletionHandler(self, nil);
}

- (void)rewardedVideoManager:(SASRewardedVideoManager *)manager didFailToLoadWithError:(NSError *)error {
    self.loadCompletionHandler(nil, error);
}

- (void)rewardedVideoManager:(SASRewardedVideoManager *)manager didAppearFromViewController:(UIViewController *)viewController {
    [self.delegate willPresentFullScreenView];
    [self.delegate reportImpression];
}

- (void)rewardedVideoManager:(SASRewardedVideoManager *)manager didDisappearFromViewController:(UIViewController *)viewController {
    [self.delegate willDismissFullScreenView];
}

- (void)rewardedVideoManager:(SASRewardedVideoManager *)manager didCollectReward:(SASReward *)reward {
    GADAdReward *gadReward = [[GADAdReward alloc] initWithRewardType:reward.currency
                                                     rewardAmount:[NSDecimalNumber decimalNumberWithDecimal:[reward.amount decimalValue]]];
    [self.delegate didRewardUser];
}

- (void)rewardedVideoManager:(SASRewardedVideoManager *)manager didClickWithURL:(NSURL *)URL {
    [self.delegate reportClick];
}

@end

