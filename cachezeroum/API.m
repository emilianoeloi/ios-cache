//
//  API.m
//  cachezeroum
//
//  Created by emilianoeloi on 2/17/15.
//  Copyright (c) 2015 Emiliano Eloi. All rights reserved.
//

#import "HTTPRequestHelper.h"
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
    
    [[HTTPRequestHelper sharedHelper]getWithUrl:kAPIGithubUsers andCompletion:^(id result, NSError *error) {
        if (error) {
            completion(nil,error);
            return;
        }
        NSMutableArray *users = [[NSMutableArray alloc]init];
        NSError *iterationError = nil;
        for (NSDictionary *dict in result) {
            iterationError = nil;
            User *user = [[User alloc] initWithDictionary:dict error:&iterationError];
            if (iterationError) {
                completion(nil, iterationError);
                break;return;
            }
            if (user) {
                [users addObject:user];
            }
        }
        
        completion(users,nil);
        
    }];
}

-(void)fetchUser:(User *)user andCompletion:(UserBlock)completion{
    
    [[HTTPRequestHelper sharedHelper]getWithUrl:[NSString stringWithFormat:kAPIGithubUser, user.login ] andCompletion:^(id result, NSError *error) {
        if (error) {
            completion(nil,error);
            return;
        }
        NSError *iterationError = nil;
        User *user = [[User alloc] initWithDictionary:result error:&iterationError];
        if (iterationError) {
            completion(nil, iterationError);
            return;
        }
        completion(user,nil);
    }];
}

-(void)fetchEvent:(Org *)org andCompletion:(EventsBlock)completion{
    
    [[HTTPRequestHelper sharedHelper]getWithUrl:[NSString stringWithFormat:kAPIGithubOrgEvents,org.login] andCompletion:^(id result, NSError *error) {
        if (error) {
            completion(nil,error);
            return;
        }
        NSMutableArray *events = [[NSMutableArray alloc]init];
        NSError *iterationError = nil;
        for (NSDictionary *dict in result) {
            iterationError = nil;
            Event *event = [[Event alloc] initWithDictionary:dict error:&iterationError];
            if (iterationError) {
                completion(nil, iterationError);
                break;return;
            }
            if (event) {
                [events addObject:event];
            }
        }
        
        completion(events,nil);
        
    }];
}

@end
