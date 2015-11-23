//
//  Payload.h
//  cachezeroum
//
//  Created by Emiliano Barbosa on 11/23/15.
//  Copyright © 2015 Emiliano Eloi. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Commit.h"

/*
 "push_id": 872298955,
 "size": 1,
 "distinct_size": 1,
 "ref": "refs/heads/master",
 "head": "fa68c60e58caab7c4dc0a86a3ccbdb4b7b7dedec",
 "before": "b190ed8c542f870a4383f0abf9afdb672c7524b4",
 "commits": [
 {
 "sha": "fa68c60e58caab7c4dc0a86a3ccbdb4b7b7dedec",
 "author": {
 "email": "renan.carvalho@corp.globo.com",
 "name": "Renan Mendes Carvalho"
 },
 "message": "Update for version 0.5.1",
 "distinct": true,
 "url": "https://api.github.com/repos/globocom/content-gateway-ruby/commits/fa68c60e58caab7c4dc0a86a3ccbdb4b7b7dedec"
 }
 ]
 */

@interface Payload : JSONModel

@property (nonatomic, strong) NSNumber<Optional> *pushId;
@property (nonatomic, strong) NSNumber<Optional> *size;
@property (nonatomic, strong) NSNumber<Optional> *distinctSize;
@property (nonatomic, strong) NSString<Optional> *ref;
@property (nonatomic, strong) NSString<Optional> *read;
@property (nonatomic, strong) NSString<Optional> *before;
@property (nonatomic, strong) NSArray<Commit> *commits;

@end
