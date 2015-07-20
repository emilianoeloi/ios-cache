//
//  ConfigHelper.h
//  cachezeroum
//
//  Created by Emiliano Barbosa on 7/20/15.
//  Copyright (c) 2015 Emiliano Eloi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConfigHelper : NSObject

+(instancetype)sharedConfig;
-(void)saveConfigWithKey:(NSString *)key andValue:(id)value;
-(void)fetchConfigWithKey:(NSString *)key completion:(FetchConfigWithKeyBlock)completion;

@end
