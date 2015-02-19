//
//  SMCache.h
//  SOL Mobile
//
//  Created by emilianoeloi on 1/23/15.
//  Copyright (c) 2015 DevsUp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheHelper : NSObject

+ (instancetype)sharedCache;

-(void)setCacheWithCacheKey:(NSString *) cacheKey andCacheValue:(id)cacheValue;
-(id)getCacheWithCacheKey:(NSString *) cacheKey;
-(BOOL) hasCacheWithCacheKey:(NSString *) cacheKey;

@end
