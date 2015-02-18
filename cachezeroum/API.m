//
//  API.m
//  cachezeroum
//
//  Created by emilianoeloi on 2/17/15.
//  Copyright (c) 2015 Emiliano Eloi. All rights reserved.
//

#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "API.h"

@implementation API

+ (id)sharedAPI
{
    static dispatch_once_t onceToken;
    static API *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        if (sharedInstance == nil){
            sharedInstance = [[API alloc] init];
        }
    });
    return sharedInstance;
}

-(void)fetchUsers:(UsersBlock)completion{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:kAPIGithubUsers parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *users = [[NSMutableArray alloc]init];
        NSError *iterationError = nil;
        for (NSDictionary *dict in responseObject) {
            iterationError = nil;
            User *user = [[User alloc] initWithDictionary:dict error:&iterationError];
            if (user) {
                [users addObject:user];
            }
        }
        completion(users,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error.description);
        completion(nil,error);
    }];
    
}

-(void)fetchUser:(User *)user andCompletion:(UserBlock)completion{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat:kAPIGithubUser, user.login ] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *iterationError = nil;
        User *user = [[User alloc] initWithDictionary:responseObject error:&iterationError];
        completion(user,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error.description);
        completion(nil,error);
    }];
}

@end
