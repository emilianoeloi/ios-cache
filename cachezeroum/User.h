//
//  User.h
//  cachezeroum
//
//  Created by emilianoeloi on 2/17/15.
//  Copyright (c) 2015 Emiliano Eloi. All rights reserved.
//

#import "JSONModel.h"

@interface User : JSONModel

@property (nonatomic, strong) NSString<Optional> *login;
@property (nonatomic, strong) NSNumber<Optional> *userId;
@property (nonatomic, strong) NSString<Optional> *avatarUrl;
@property (nonatomic, strong) NSString<Optional> *gravatarId;
@property (nonatomic, strong) NSString<Optional> *url;
@property (nonatomic, strong) NSString<Optional> *htmlUrl;
@property (nonatomic, strong) NSString<Optional> *followersUrl;
@property (nonatomic, strong) NSString<Optional> *followingUrl;
@property (nonatomic, strong) NSString<Optional> *gistsUrl;
@property (nonatomic, strong) NSString<Optional> *starredUrl;
@property (nonatomic, strong) NSString<Optional> *subscriptionsUrl;
@property (nonatomic, strong) NSString<Optional> *organizationsUrl;
@property (nonatomic, strong) NSString<Optional> *reposUrl;
@property (nonatomic, strong) NSString<Optional> *receivedEventsUrl;
@property (nonatomic, strong) NSString<Optional> *type;
@property (nonatomic, strong) NSString<Optional> *siteAdmin;
@property (nonatomic, strong) NSString<Optional> *name;
@property (nonatomic, strong) NSString<Optional> *company;
@property (nonatomic, strong) NSString<Optional> *blog;
@property (nonatomic, strong) NSString<Optional> *location;
@property (nonatomic, strong) NSString<Optional> *email;
@property (nonatomic, strong) NSNumber<Optional> *hireable;
@property (nonatomic, strong) NSString<Optional> *bio;
@property (nonatomic, strong) NSNumber<Optional> *publicRepos;
@property (nonatomic, strong) NSNumber<Optional> *publicGists;
@property (nonatomic, strong) NSNumber<Optional> *followers;
@property (nonatomic, strong) NSNumber<Optional> *following;
@property (nonatomic, strong) NSString<Optional> *createdAt;
@property (nonatomic, strong) NSString<Optional> *updatedAt;


@end
