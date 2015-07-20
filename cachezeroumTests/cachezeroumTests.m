//
//  cachezeroumTests.m
//  cachezeroumTests
//
//  Created by emilianoeloi on 2/17/15.
//  Copyright (c) 2015 Emiliano Eloi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AppDelegate.h"

#define CACHE_KEY @"GENERAL_CACHE"
#define CONFIG_ENTITY_NAME @"Config"
#define CONFIG_ENTITY_ATTR_KEY @"key"
#define CONFIG_ENTITY_ATTR_VALUE @"value"

@interface cachezeroumTests : XCTestCase

@end

@implementation cachezeroumTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testACacheSave {
    
    NSMutableDictionary *arr = [[NSMutableDictionary alloc]init];
    [arr addEntriesFromDictionary:[[NSMutableDictionary alloc]init]];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSManagedObject *newCache = [NSEntityDescription insertNewObjectForEntityForName:CONFIG_ENTITY_NAME inManagedObjectContext:context];
    [newCache setValue:CACHE_KEY forKey:CONFIG_ENTITY_ATTR_KEY];
    [newCache setValue:arr forKey:CONFIG_ENTITY_ATTR_VALUE];
    NSError *error;
    [context save:&error];
    
    XCTAssertNil(error, @"Não é Nulo");
}

- (void)testBCacheRetrieve {
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *cacheDescription = [NSEntityDescription entityForName:CONFIG_ENTITY_NAME inManagedObjectContext:context];
    NSFetchRequest *request =  [[NSFetchRequest alloc]init];
    [request setEntity:cacheDescription];
    NSString *formatToFormat = [NSString stringWithFormat:@"(%@=%@)",CONFIG_ENTITY_ATTR_KEY,@"%@"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:formatToFormat, CACHE_KEY];
    [request setPredicate:predicate];
    NSError *error;
    NSArray *caches = [context executeFetchRequest:request error:&error];
    
    NSManagedObject *firstCache = caches[0];
    NSMutableArray *cacheData = [firstCache valueForKey:CONFIG_ENTITY_ATTR_VALUE];
    
    XCTAssertNil(error, @"Não é Nulo");
    XCTAssertNotNil(cacheData, "Não tem valor nenhum");
}
@end
