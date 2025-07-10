// SASGMAAdNetworkExtras.h
#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>

NS_ASSUME_NONNULL_BEGIN

@interface SASGMAAdNetworkExtras : NSObject <GADAdNetworkExtras>

@property (nonatomic, strong) NSArray<NSString *> *keywords;

- (instancetype)initWithKeywords:(NSArray<NSString *> *)keywords;

@end

NS_ASSUME_NONNULL_END

