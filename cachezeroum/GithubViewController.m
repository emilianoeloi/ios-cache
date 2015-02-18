//
//  GithubViewController.m
//  cachezeroum
//
//  Created by emilianoeloi on 2/18/15.
//  Copyright (c) 2015 Emiliano Eloi. All rights reserved.
//

#import "GithubViewController.h"
#import "UIWebView+AFNetworking.h"

@interface GithubViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *githubWeb;

@end

@implementation GithubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SVProgressHUD show];
    NSURL *githubUrl = [NSURL URLWithString:_user.htmlUrl];
    NSURLRequest *githubRequest = [NSURLRequest requestWithURL:githubUrl];
    [_githubWeb loadRequest:githubRequest progress:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
        NSLog(@"");
    } success:^NSString *(NSHTTPURLResponse *response, NSString *HTML) {
        [SVProgressHUD dismiss];
        return HTML;
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
