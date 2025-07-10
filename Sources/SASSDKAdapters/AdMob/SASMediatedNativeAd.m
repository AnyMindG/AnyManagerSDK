//
//  SASMediatedNativeAd.m
//  AnyManagerSDKDemoApp
//
//  Created by Narender on 28/05/25.
//

// SASMediatedNativeAd.m
#import "SASMediatedNativeAd.h"

@implementation SASMediatedNativeAd

- (instancetype)initWithNativeAd:(SASNativeAd *)nativeAd {
    self = [super init];
    if (self) {
        _sasNativeAd = nativeAd;
        _sasAdChoicesView = [[SASAdChoicesView alloc] init];
        
        if (_sasNativeAd.hasMedia) {
            _sasNativeAdMediaView = [[SASNativeAdMediaView alloc] init];
        } else {
            _sasNativeAdMediaView = nil;
        }
    }
    return self;
}

- (void)fetchAssetsIfNeededWithCompletionHandler:(void (^)(NSError *))completionHandler {
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    __block BOOL errorOccured = NO;
    dispatch_group_t downloadAssetsGroup = dispatch_group_create();
    
    if (_sasNativeAd.icon) {
        dispatch_group_enter(downloadAssetsGroup);
        NSURL *iconURL = _sasNativeAd.icon.URL;
        NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithURL:iconURL completionHandler:^(NSData *data, NSURLResponse *urlResponse, NSError *error) {
            if (error) {
                errorOccured = YES;
            } else if (data) {
                UIImage *iconImage = [UIImage imageWithData:data];
                if (iconImage) {
                    self.icon = [[GADNativeAdImage alloc] initWithImage:iconImage];
                } else {
                    errorOccured = YES;
                }
            } else {
                errorOccured = YES;
            }
            dispatch_group_leave(downloadAssetsGroup);
        }];
        [dataTask resume];
    }
    
    if (_sasNativeAd.coverImage) {
        dispatch_group_enter(downloadAssetsGroup);
        NSURL *coverURL = _sasNativeAd.coverImage.URL;
        NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithURL:coverURL completionHandler:^(NSData *data, NSURLResponse *urlResponse, NSError *error) {
            if (error) {
                errorOccured = YES;
            } else if (data) {
                UIImage *coverImage = [UIImage imageWithData:data];
                if (coverImage) {
                    self.mappedImages = @[[[GADNativeAdImage alloc] initWithImage:coverImage]];
                } else {
                    errorOccured = YES;
                }
            } else {
                errorOccured = YES;
            }
            dispatch_group_leave(downloadAssetsGroup);
        }];
        [dataTask resume];
    }
    
    dispatch_group_notify(downloadAssetsGroup, dispatch_get_main_queue(), ^{
        if (errorOccured) {
            NSError *error = [NSError errorWithDomain:@"SASGMAErrorDomain"
                                                 code:1001
                                             userInfo:nil];
            completionHandler(error);
        } else {
            completionHandler(nil);
        }
    });
}

- (UIView *)adChoicesView {
    return _sasAdChoicesView;
}

- (NSString *)body {
    return _sasNativeAd.body;
}

- (NSString *)callToAction {
    return _sasNativeAd.callToAction;
}

- (BOOL)hasVideoContent {
    return _sasNativeAd.hasMedia;
}

- (NSString *)headline {
    return _sasNativeAd.title;
}

- (NSArray<GADNativeAdImage *> *)images {
    return _mappedImages;
}

- (UIView *)mediaView {
    return _sasNativeAdMediaView;
}

- (NSString *)price {
    return _sasNativeAd.price;
}

- (void)nativeAd:(SASNativeAd *)nativeAd didClickWithURL:(NSURL *)URL {
    [_gadDelegate reportClick];
}

- (void)nativeAdMediaView:(SASNativeAdMediaView *)mediaView didSendVideoEvent:(SASVideoEvent)videoEvent {
    switch (videoEvent) {
        case SASVideoEventStart:
            [_gadDelegate didPlayVideo];
            break;
        case SASVideoEventPause:
            [_gadDelegate didPauseVideo];
            break;
        case SASVideoEventComplete:
            [_gadDelegate didEndVideo];
            break;
        case SASVideoEventEnterFullscreen:
            [_gadDelegate willPresentFullScreenView];
            break;
        case SASVideoEventExitFullscreen:
            [_gadDelegate didDismissFullScreenView];
            break;
        default:
            break;
    }
}

- (void)didRenderInView:(UIView *)view clickableAssetViews:(NSDictionary<GADNativeAssetIdentifier, UIView *> *)clickableAssetViews nonclickableAssetViews:(NSDictionary<GADNativeAssetIdentifier, UIView *> *)nonclickableAssetViews viewController:(UIViewController *)viewController {
    _sasNativeAd.delegate = self;
    [_sasNativeAd registerView:view modalParentViewController:viewController];
    [_sasAdChoicesView registerNativeAd:_sasNativeAd modalParentViewController:viewController];
    if (_sasNativeAd.hasMedia) {
        [_sasNativeAdMediaView registerNativeAd:_sasNativeAd];
        _sasNativeAdMediaView.delegate = self;
    }
    [_gadDelegate reportImpression];
}

- (void)didUntrackView:(UIView *)view {
    [_sasNativeAd unregisterViews];
}

@synthesize advertiser;

@synthesize starRating;

@synthesize store;

@synthesize extraAssets;

@end
