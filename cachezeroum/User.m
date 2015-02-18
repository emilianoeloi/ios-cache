//
//  User.m
//  cachezeroum
//
//  Created by emilianoeloi on 2/17/15.
//  Copyright (c) 2015 Emiliano Eloi. All rights reserved.
//

#import "User.h"

/*
 "login": "mojombo",
 "id": 1,
 "avatar_url": "https://avatars.githubusercontent.com/u/1?v=3",
 "gravatar_id": "",
 "url": "https://api.github.com/users/mojombo",
 "html_url": "https://github.com/mojombo",
 "followers_url": "https://api.github.com/users/mojombo/followers",
 "following_url": "https://api.github.com/users/mojombo/following{/other_user}",
 "gists_url": "https://api.github.com/users/mojombo/gists{/gist_id}",
 "starred_url": "https://api.github.com/users/mojombo/starred{/owner}{/repo}",
 "subscriptions_url": "https://api.github.com/users/mojombo/subscriptions",
 "organizations_url": "https://api.github.com/users/mojombo/orgs",
 "repos_url": "https://api.github.com/users/mojombo/repos",
 "events_url": "https://api.github.com/users/mojombo/events{/privacy}",
 "received_events_url": "https://api.github.com/users/mojombo/received_events",
 "type": "User",
 "site_admin": false,
 "name": "Tom Preston-Werner",
 "company": "",
 "blog": "http://tom.preston-werner.com",
 "location": "San Francisco",
 "email": "tom@mojombo.com",
 "hireable": false,
 "bio": null,
 "public_repos": 58,
 "public_gists": 65,
 "followers": 17713,
 "following": 11,
 "created_at": "2007-10-20T05:24:19Z",
 "updated_at": "2015-02-17T17:49:31Z"
 */

@implementation User

+ (JSONKeyMapper *)keyMapper{
    NSDictionary *mapper  = @{ @"login": @"login",
                               @"id": @"userId",
                               @"avatar_url": @"avatarUrl",
                               @"gravatar_id": @"gravatarId",
                               @"url": @"url",
                               @"html_url": @"htmlUrl",
                               @"followers_url": @"followersUrl",
                               @"following_url": @"followingUrl",
                               @"gists_url": @"gistsUrl",
                               @"starred_url": @"starredUrl",
                               @"subscriptions_url": @"subscriptionsUrl",
                               @"organizations_url": @"organizationsUrl",
                               @"repos_url": @"reposUrl",
                               @"events_url": @"eventsUrl",
                               @"received_events_url": @"receivedEventsUrl",
                               @"type": @"type",
                               @"site_admin": @"siteAdmin",
                               @"name": @"name",
                               @"company": @"company",
                               @"blog": @"blog",
                               @"location": @"location",
                               @"email": @"email",
                               @"hireable": @"hireable",
                               @"bio": @"bio",
                               @"public_repos": @"publicRepos",
                               @"public_gists": @"publicGists",
                               @"followers": @"followers",
                               @"following": @"following",
                               @"created_at": @"createdAt",
                               @"updated_at": @"updatedAt"};
    return [[JSONKeyMapper alloc]initWithDictionary:mapper];
}

@end
