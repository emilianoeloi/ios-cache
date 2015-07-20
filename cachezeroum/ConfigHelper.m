//
//  ConfigHelper.m
//  cachezeroum
//
//  Created by Emiliano Barbosa on 7/20/15.
//  Copyright (c) 2015 Emiliano Eloi. All rights reserved.
//

#import "ConfigHelper.h"
#import "AppDelegate.h"

#define CONFIG_ENTITY_NAME @"Config"
#define CONFIG_ENTITY_ATTR_KEY @"key"
#define CONFIG_ENTITY_ATTR_VALUE @"value"

@implementation ConfigHelper

+ (instancetype) sharedConfig{
    static ConfigHelper *_sharedConfig;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedConfig = [[self alloc]init];
    });
    return _sharedConfig;
}

-(void)saveConfigWithKey:(NSString *)key andValue:(id)value{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSManagedObject *newCache = [NSEntityDescription insertNewObjectForEntityForName:CONFIG_ENTITY_NAME inManagedObjectContext:context];
    [newCache setValue:key forKey:CONFIG_ENTITY_ATTR_KEY];
    [newCache setValue:value forKey:CONFIG_ENTITY_ATTR_VALUE];
    NSError *error;
    [context save:&error];
#warning FIXME: Treat error
}

-(void)fetchConfigWithKey:(NSString *)key completion:(FetchConfigWithKeyBlock)completion{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *cacheDescription = [NSEntityDescription entityForName:CONFIG_ENTITY_NAME inManagedObjectContext:context];
    NSFetchRequest *request =  [[NSFetchRequest alloc]init];
    [request setEntity:cacheDescription];
    NSString *formatToFormat = [NSString stringWithFormat:@"(%@=%@)",CONFIG_ENTITY_ATTR_KEY,@"%@"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:formatToFormat, key];
    [request setPredicate:predicate];
    NSError *error;
    NSArray *values = [context executeFetchRequest:request error:&error];
    if (values && [values count] > 0) {
        NSManagedObject *firstCache = values[0];
        id value = [firstCache valueForKey:CONFIG_ENTITY_ATTR_VALUE];
        completion(value, error);
    }
    
}

@end
