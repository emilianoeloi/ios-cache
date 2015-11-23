//
//  Commit.h
//  cachezeroum
//
//  Created by Emiliano Barbosa on 11/23/15.
//  Copyright © 2015 Emiliano Eloi. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "User.h"

/*
 
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
 
 */

@protocol Commit
@end

@interface Commit : JSONModel

@property (nonatomic, strong) NSString<Optional> *sha;
@property (nonatomic, strong) User<Optional> *author;
@property (nonatomic, strong) NSString<Optional> *message;
@property (nonatomic, strong) NSString<Optional> *distinct;
@property (nonatomic, strong) NSString *url;

@end
