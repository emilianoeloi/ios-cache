//
//  HTTPRequestHelper.m
//  cachezeroum
//
//  Created by emilianoeloi on 2/18/15.
//  Copyright (c) 2015 Emiliano Eloi. All rights reserved.
//

#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "HTTPRequestHelper.h"
#import "CacheHelper.h"

@interface HTTPRequestHelper()
@property (nonatomic, strong) Cache *cache;

@end

@implementation HTTPRequestHelper

+ (instancetype)sharedHelper
{
    static HTTPRequestHelper *_sharedHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedHelper = [[HTTPRequestHelper alloc] init];
    });
    
    return _sharedHelper;
}

-(void)saveInCache{
    [[CacheHelper sharedHelper]setCacheWithCacheKey:_cache.key andCacheValue:_cache.jsonResult];
}

-(void)getWithUrl:(NSString *)url andCompletion:(HttpRequestHelperGetBlock)completion{
    
    if ([[CacheHelper sharedHelper]hasCacheWithCacheKey:url]) {
        completion([[CacheHelper sharedHelper]getCacheWithCacheKey:url], nil);
        return;
    }
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {

        @try {
            _cache = [[Cache alloc]init];
            _cache.screenId = 0;
            _cache.key = url;
            _cache.jsonResult = responseObject;
            _cache.createdAt = [NSDate date];
            [self saveInCache];
        }
        @catch (NSException *exception) {
            NSLog(@"Não compromete o funcionamento do aplicativo, Informar no Crashlytics %@", exception.description);
        }

        completion(responseObject,nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error.description);
        completion(nil,error);
    }];
}



@end
