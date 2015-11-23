//
//  Org.h
//  cachezeroum
//
//  Created by Emiliano Barbosa on 11/23/15.
//  Copyright © 2015 Emiliano Eloi. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface Org : JSONModel

@property (nonatomic, strong) NSNumber<Optional> *orgId;
@property (nonatomic, strong) NSString<Optional> *login;
@property (nonatomic, strong) NSString<Optional> *gravatarId;
@property (nonatomic, strong) NSString<Optional> *url;
@property (nonatomic, strong) NSString<Optional> *avatarUrl;

@end
