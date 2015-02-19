//
//  HTTPRequestHelper.h
//  cachezeroum
//
//  Created by emilianoeloi on 2/18/15.
//  Copyright (c) 2015 Emiliano Eloi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPRequestHelper : NSObject

+ (instancetype)sharedHelper;
-(void)getWithUrl:(NSString *)url andCompletion:(HttpRequestHelperGetBlock)completion;

@end
