//
//  SMCache.m
//  SOL Mobile
//
//  Created by emilianoeloi on 1/23/15.
//  Copyright (c) 2015 DevsUp. All rights reserved.
//

#import "CacheHelper.h"
#import <CommonCrypto/CommonCrypto.h>

@interface CacheHelper()

@property (nonatomic, strong) NSMutableDictionary *cacheData;

@end

@implementation CacheHelper

+ (instancetype)sharedCache
{
    static CacheHelper* _sharedCache;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedCache = [[self alloc] init];
        _sharedCache.cacheData = [[NSMutableDictionary alloc]init];
    });
    
    return _sharedCache;
}

-(NSString *)hashWithText:(NSString *)text{
    const char *cStr = [text UTF8String];
    unsigned char digest[16];
    
    CC_MD5( cStr, strlen(cStr), digest );
    
    NSMutableString *resultString = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++){
        [resultString appendFormat:@"%02x", digest[i]];
    }
    return  resultString;
}

-(void)setCacheWithCacheKey:(NSString *) cacheKey andCacheValue:(id)cacheValue{
    NSLog(@"Salvando no Cache: %@", cacheKey);
    NSString *hashKey = [self hashWithText:cacheKey];
    [_cacheData setObject:cacheValue forKey:hashKey];
}
-(id)getCacheWithCacheKey:(NSString *) cacheKey{
    NSString *hashKey = [self hashWithText:cacheKey];
    return [_cacheData valueForKey:hashKey];
}
-(BOOL)hasCacheWithCacheKey:(NSString *) cacheKey{
    NSString *hashKey = [self hashWithText:cacheKey];
    return [[_cacheData valueForKey:hashKey] count]?YES:NO;
}

@end
