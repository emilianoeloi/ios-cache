//
//  Event.m
//  cachezeroum
//
//  Created by Emiliano Barbosa on 11/23/15.
//  Copyright © 2015 Emiliano Eloi. All rights reserved.
//

#import "Event.h"

/*
 "type": "Event",
 "public": true,
 "payload": {
 },
 "repo": {
 "id": 3,
 "name": "octocat/Hello-World",
 "url": "https://api.github.com/repos/octocat/Hello-World"
 },
 "actor": {
 "id": 1,
 "login": "octocat",
 "gravatar_id": "",
 "avatar_url": "https://github.com/images/error/octocat_happy.gif",
 "url": "https://api.github.com/users/octocat"
 },
 "org": {
 "id": 1,
 "login": "github",
 "gravatar_id": "",
 "url": "https://api.github.com/orgs/github",
 "avatar_url": "https://github.com/images/error/octocat_happy.gif"
 },
 "created_at": "2011-09-06T17:26:27Z",
 "id": "12345"
 */

@implementation Event

+ (JSONKeyMapper *)keyMapper{
    NSDictionary *mapper  = @{ @"id": @"eventId",
                               @"type": @"type",
                               @"public": @"eventPublic",
                               @"payload": @"payload",
                               @"repo": @"repo",
                               @"actor": @"actor",
                               @"created_at": @"createdAt",
                               @"updated_at": @"updatedAt"};
    return [[JSONKeyMapper alloc]initWithDictionary:mapper];
}

@end
