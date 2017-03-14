//
//  LoginViewController.m
//  UISkeletonStoryboard
//
//  Created by kun shen on 2017/3/13.
//  Copyright © 2017年 kun shen. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

- (IBAction)doBack:(id)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

#pragma mark -
#pragma mark Button functions

- (IBAction)doBack:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@"返回了");
    }];
}

@end
