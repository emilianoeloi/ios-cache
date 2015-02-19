//
//  Cache.h
//  cachezeroum
//
//  Created by emilianoeloi on 2/18/15.
//  Copyright (c) 2015 Emiliano Eloi. All rights reserved.
//

#import "JSONModel.h"

@interface Cache : JSONModel

@property (nonatomic, strong) NSNumber *screenId;
@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *jsonResult;
@property (nonatomic, strong) NSDate *createdAt;

@end
