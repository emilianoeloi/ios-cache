//
//  HomeViewController.m
//  cachezeroum
//
//  Created by emilianoeloi on 2/17/15.
//  Copyright (c) 2015 Emiliano Eloi. All rights reserved.
//

#import "HomeViewController.h"
#import "UserViewController.h"
#import "API.h"
#import "UserCell.h"

@implementation HomeViewController

-(void)viewDidLoad{
    [self loadUsers];
}

-(void)loadUsers{
    [SVProgressHUD show];
    [[API sharedAPI]fetchUsers:^(NSArray *users, NSError *error) {
        _userList = users;
        [_userTable reloadData];
        [SVProgressHUD dismiss];
    }];
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_userList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell_ID" forIndexPath:indexPath];
    cell.user = _userList[indexPath.row];
    cell.textLabel.text = cell.user.login;
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UserViewController *dest = [segue destinationViewController];
    UserCell *cell = (UserCell *)sender;
    dest.user = cell.user;
}

@end
