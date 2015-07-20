//
//  SMCache.m
//  SOL Mobile
//
//  Created by emilianoeloi on 1/23/15.
//  Copyright (c) 2015 DevsUp. All rights reserved.
//

#import "CacheHelper.h"
#import "ConfigHelper.h"
#import <CommonCrypto/CommonCrypto.h>
#import "NSString+MD5.h"

#define CACHE_KEY @"GENERAL_CACHE"

@interface CacheHelper()

@property (nonatomic, strong) NSMutableDictionary *cacheData;

@end

@implementation CacheHelper

+ (instancetype)sharedHelper
{
    static CacheHelper* _sharedCache;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedCache = [[self alloc] init];
        _sharedCache.cacheData = [[NSMutableDictionary alloc]init];
    });
    
    return _sharedCache;
}

-(void)saveCacheWithCacheKey:(NSString *) cacheKey andCacheValue:(id)cacheValue{
    NSString *hashKey = [cacheKey MD5Digest];
#ifdef DEBUG
    NSLog(@"Salvando no Cache: %@ | %@", cacheKey, hashKey);
#endif
    [_cacheData setObject:cacheValue forKey:hashKey];
}
-(id)cacheWithCacheKey:(NSString *) cacheKey{
    NSString *hashKey = [cacheKey MD5Digest];
#ifdef DEBUG
    NSLog(@"Obtendo do Cache: %@ | %@", cacheKey, hashKey);
#endif
    return [_cacheData valueForKey:hashKey];
}
-(BOOL)hasCacheWithCacheKey:(NSString *) cacheKey{
    NSString *hashKey = [cacheKey MD5Digest];
    return [[_cacheData valueForKey:hashKey] count]?YES:NO;
}

-(void)loadDiskCache{
    [[ConfigHelper sharedConfig] fetchConfigWithKey:CACHE_KEY completion:^(id result, NSError *error) {
        if (result) {
            _cacheData = [[NSMutableDictionary alloc]initWithDictionary:result];
        }
    }];
}

-(void)saveCacheInDisk{
    [[ConfigHelper sharedConfig] saveConfigWithKey:CACHE_KEY andValue:_cacheData];
}

@end
