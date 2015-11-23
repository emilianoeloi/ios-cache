//
//  Repo.h
//  cachezeroum
//
//  Created by Emiliano Barbosa on 11/23/15.
//  Copyright © 2015 Emiliano Eloi. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface Repo : JSONModel

@property (nonatomic, strong) NSNumber<Optional> *repoId;
@property (nonatomic, strong) NSString<Optional> *name;
@property (nonatomic, strong) NSString<Optional> *url;

@end
    