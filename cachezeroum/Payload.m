//
//  Payload.m
//  cachezeroum
//
//  Created by Emiliano Barbosa on 11/23/15.
//  Copyright © 2015 Emiliano Eloi. All rights reserved.
//

#import "Payload.h"

@implementation Payload

+ (JSONKeyMapper *)keyMapper{
    NSDictionary *mapper  = @{ @"id": @"pushId",
                               @"size": @"size",
                               @"distinct_size": @"distinctSize",
                               @"ref": @"ref",
                               @"repo": @"repo",
                               @"read": @"read",
                               @"before": @"before",
                               @"commits": @"commits"};
    return [[JSONKeyMapper alloc]initWithDictionary:mapper];
}

@end
