// SASGMABannerAdapter.m
// Adapter for Google Mobile Ad Mediation
//
// Created by Julien Gomez on 01/03/2022.

#import "SASGMABannerAdapter.h"
#import "SASGMAUtils.h"

@implementation SASGMABannerAdapter

- (instancetype)init {
    self = [super init];
    if (self) {
        _view = [[SASBannerView alloc] initWithFrame:CGRectZero];
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

- (void)loadBannerForAdConfiguration:(GADMediationBannerAdConfiguration *)adConfiguration
                   completionHandler:(GADMediationBannerLoadCompletionHandler)completionHandler {
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
    
    if ([self.view isKindOfClass:[SASBannerView class]]) {
        SASBannerView *bannerView = (SASBannerView *)self.view;
        bannerView.frame = CGRectMake(0, 0, adConfiguration.adSize.size.width, adConfiguration.adSize.size.height);
        bannerView.modalParentViewController = adConfiguration.topViewController;
        bannerView.delegate = self;
        
        // Load the banner ad
        [bannerView loadWithPlacement:placement];
    }
}


// SASBannerViewDelegate implementation

- (void)bannerViewDidLoad:(SASBannerView *)bannerView {
    self.delegate = self.loadCompletionHandler(self, nil);
    [self.delegate reportImpression];
}

- (void)bannerView:(SASBannerView *)bannerView didFailToLoadWithError:(NSError *)error {
    self.loadCompletionHandler(nil, error);
}

- (void)bannerView:(SASBannerView *)bannerView didClickWithURL:(NSURL *)URL {
    [self.delegate reportClick];
}

- (void)bannerViewWillPresentModalView:(SASBannerView *)bannerView {
    [self.delegate willPresentFullScreenView];
}

- (void)bannerViewWillDismissModalView:(SASBannerView *)bannerView {
    [self.delegate willDismissFullScreenView];
}

@end
