//
//  Org.m
//  cachezeroum
//
//  Created by Emiliano Barbosa on 11/23/15.
//  Copyright © 2015 Emiliano Eloi. All rights reserved.
//

#import "Org.h"

@implementation Org

+ (JSONKeyMapper *)keyMapper{
    NSDictionary *mapper  = @{ @"id": @"orgId",
                               @"login": @"login",
                               @"gravatar_id": @"gravatarId",
                               @"url": @"url",
                               @"avatar_url": @"avatarUrl"};
    return [[JSONKeyMapper alloc]initWithDictionary:mapper];
}

@end
