//
//  UserViewController.m
//  cachezeroum
//
//  Created by emilianoeloi on 2/17/15.
//  Copyright (c) 2015 Emiliano Eloi. All rights reserved.
//

#import "UserViewController.h"
#import "GithubViewController.h"
#import "API.h"


@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *avatarUrl = [NSURL URLWithString:_user.avatarUrl];
    [_avatar setImageWithURL:avatarUrl];
    [_avatar c
    
    [self loadUser];
}

-(void)loadUser{
    [SVProgressHUD show];
    [[API sharedAPI]fetchUser:_user andCompletion:^(User *user, NSError *error) {
        _user = user;
        _userName.text = _user.name;
        _userLogin.text = _user.login;
        _publicRepos.text = [_user.publicRepos stringValue];
        _publicGists.text = [_user.publicGists stringValue];
        _followers.text = [_user.followers stringValue];
        _following.text = [_user.following stringValue];
        [SVProgressHUD dismiss];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    GithubViewController *destViewController = segue.destinationViewController;
    destViewController.user = _user;
}

@end
