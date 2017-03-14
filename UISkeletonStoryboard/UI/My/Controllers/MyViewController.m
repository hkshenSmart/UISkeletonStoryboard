//
//  MyViewController.m
//  UISkeletonStoryboard
//
//  Created by kun shen on 2017/3/13.
//  Copyright © 2017年 kun shen. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

- (IBAction)doLogin:(id)sender;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的";
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

- (IBAction)doLogin:(id)sender {
    
    // 弹出有导航栏的模态视图
    [self performSegueWithIdentifier:@"gotoLoginNavigationController" sender:self];
}

@end
