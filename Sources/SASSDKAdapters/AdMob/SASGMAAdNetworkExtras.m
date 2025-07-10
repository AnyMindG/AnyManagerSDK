// SASGMAAdNetworkExtras.m
#import "SASGMAAdNetworkExtras.h"

@implementation SASGMAAdNetworkExtras

- (instancetype)initWithKeywords:(NSArray<NSString *> *)keywords {
    self = [super init];
    if (self) {
        _keywords = keywords;
    }
    return self;
}

@end

