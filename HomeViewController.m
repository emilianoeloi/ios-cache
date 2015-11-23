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
#import <Crashlytics/Answers.h>

@interface HomeViewController()

@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation HomeViewController

-(void)viewDidLoad{
    [self startRefreshControl];
    [SVProgressHUD show];
    [self loadUsers];
}

-(void)loadUsers{
    [[API sharedAPI]fetchUsers:^(NSArray *users, NSError *error) {
        _userList = users;
        [self reloadData];
    }];
}

-(void)startRefreshControl{
    _refreshControl = [[UIRefreshControl alloc]init];
    [_refreshControl addTarget:self action:@selector(handleRefresh) forControlEvents:UIControlEventValueChanged];
    [_userTable addSubview:_refreshControl];
}

-(void)handleRefresh{
    [self loadUsers];
}

- (void)reloadData
{
    [_userTable reloadData];
    
    if (self.refreshControl) {
        [self.refreshControl endRefreshing];
    }
    [SVProgressHUD dismiss];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    if (_userList && [_userList count]>0) {
        _userTable.backgroundView = nil;
        _userTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        return 1;
    }else{
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        messageLabel.textColor = [UIColor blackColor];
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.font = [UIFont fontWithName:@"Helvetica-Italic" size:20];
        [messageLabel sizeToFit];
        messageLabel.text = @"Sem usuários para exibir.\n Puxe para Atualizar.";
        
        _userTable.backgroundView = messageLabel;
        _userTable.separatorStyle = UITableViewCellSelectionStyleNone;
    }
    return 0;
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
    
    [Answers logContentViewWithName:@"Github users"
                        contentType:@"Github user"
                          contentId:cell.user
                   customAttributes:@{}];
}

@end
