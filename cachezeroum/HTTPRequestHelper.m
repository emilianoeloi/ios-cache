//
//  HTTPRequestHelper.m
//  cachezeroum
//
//  Created by emilianoeloi on 2/18/15.
//  Copyright (c) 2015 Emiliano Eloi. All rights reserved.
//

#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "HTTPRequestHelper.h"

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

-(void)getWithUrl:(NSString *)url andCompletion:(HttpRequestHelperGetBlock)completion{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completion(responseObject,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error.description);
        completion(nil,error);
    }];
}



@end
