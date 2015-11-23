//
//  API.h
//  cachezeroum
//
//  Created by emilianoeloi on 2/17/15.
//  Copyright (c) 2015 Emiliano Eloi. All rights reserved.
//
#import "Constants.h"

@interface API : NSObject
+ (id)sharedAPI;
-(void)fetchUsers:(UsersBlock)completion;
-(void)fetchUser:(User *)user andCompletion:(UserBlock)completion;
-(void)fetchEvent:(Org *)org andCompletion:(EventsBlock)completion;
@end
