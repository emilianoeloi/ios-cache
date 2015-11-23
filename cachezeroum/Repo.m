//
//  Repo.m
//  cachezeroum
//
//  Created by Emiliano Barbosa on 11/23/15.
//  Copyright © 2015 Emiliano Eloi. All rights reserved.
//

#import "Repo.h"

@implementation Repo

+ (JSONKeyMapper *)keyMapper{
    NSDictionary *mapper  = @{ @"id": @"repoId",
                               @"name": @"name",
                                @"url": @"url"};
    return [[JSONKeyMapper alloc]initWithDictionary:mapper];
}

@end
