//
//  Constants.h
//  cachezeroum
//
//  Created by emilianoeloi on 2/17/15.
//  Copyright (c) 2015 Emiliano Eloi. All rights reserved.
//

#ifndef cachezeroum_Constants_h
#define cachezeroum_Constants_h

typedef void (^UsersBlock)(NSArray *users, NSError *error);
typedef void (^UserBlock)(User *user, NSError *error);
typedef void (^HttpRequestHelperGetBlock)(id result, NSError *error);

static NSString* const kAPIGithubUsers = @"https://api.github.com/users";
static NSString* const kAPIGithubUser = @"https://api.github.com/users/%@";


#endif
