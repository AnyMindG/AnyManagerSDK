//
//  SASMediatedNativeAd.h
//  AnyManagerSDKDemoApp
//
//  Created by Narender on 28/05/25.
//

#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
#import <SASDisplayKit/SASDisplayKit.h>

@interface SASMediatedNativeAd : NSObject <GADMediationNativeAd, SASNativeAdDelegate, SASNativeAdMediaViewDelegate>

@property (nonatomic, strong) SASNativeAd *sasNativeAd;
@property (nonatomic, strong) SASNativeAdMediaView *sasNativeAdMediaView;
@property (nonatomic, strong) SASAdChoicesView *sasAdChoicesView;
@property (nonatomic, weak) id<GADMediationNativeAdEventDelegate> gadDelegate;
@property (nonatomic, strong) NSArray<GADNativeAdImage *> *mappedImages;
@property (nonatomic, strong) GADNativeAdImage *icon;

- (instancetype)initWithNativeAd:(SASNativeAd *)nativeAd;
- (void)fetchAssetsIfNeededWithCompletionHandler:(void (^)(NSError *error))completionHandler;
- (UIView *)adChoicesView;
- (NSString *)body;
- (NSString *)callToAction;
- (BOOL)hasVideoContent;
- (NSString *)headline;
- (NSArray<GADNativeAdImage *> *)images;
- (UIView *)mediaView;
- (NSString *)price;
- (void)nativeAd:(SASNativeAd *)nativeAd didClickWithURL:(NSURL *)URL;
- (void)nativeAdMediaView:(SASNativeAdMediaView *)mediaView didSendVideoEvent:(SASVideoEvent)videoEvent;
- (void)didRenderInView:(UIView *)view clickableAssetViews:(NSDictionary<GADNativeAssetIdentifier, UIView *> *)clickableAssetViews nonclickableAssetViews:(NSDictionary<GADNativeAssetIdentifier, UIView *> *)nonclickableAssetViews viewController:(UIViewController *)viewController;
- (void)didUntrackView:(UIView *)view;

@end


