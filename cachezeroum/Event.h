//
//  Event.h
//  cachezeroum
//
//  Created by Emiliano Barbosa on 11/23/15.
//  Copyright © 2015 Emiliano Eloi. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Payload.h"
#import "Repo.h"
#import "User.h"
#import "Org.h"

@interface Event : JSONModel

@property (nonatomic, strong) NSNumber<Optional> *eventId;
@property (nonatomic, strong) NSString<Optional> *type;
@property (nonatomic, strong) NSString<Optional> *eventPublic;
@property (nonatomic, strong) Payload<Optional> *payload;
@property (nonatomic, strong) Repo<Optional> *repo;
@property (nonatomic, strong) User<Optional> *actor;
@property (nonatomic, strong) Org<Optional> *org;
@property (nonatomic, strong) NSString<Optional> *createdAt;
@property (nonatomic, strong) NSString<Optional> *updatedAt;


@end
