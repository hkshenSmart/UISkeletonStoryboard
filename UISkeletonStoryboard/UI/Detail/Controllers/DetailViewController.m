//
//  DetailViewController.m
//  UISkeletonStoryboard
//
//  Created by kun shen on 2017/3/13.
//  Copyright © 2017年 kun shen. All rights reserved.
//

#import "DetailViewController.h"
#import "PopViewController.h"

@interface DetailViewController ()

@property (strong, nonatomic) PopViewController *popVC;

- (IBAction)doShowPopVC:(id)sender;
- (IBAction)doBack:(id)sender;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Detail";
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

- (IBAction)doShowPopVC:(id)sender {
    // 在DetailViewController上addChildViewController
    self.popVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PopViewControllerSBID"];
    self.popVC.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    [self.navigationController addChildViewController:self.popVC];
    [self.navigationController.view addSubview:self.popVC.view];
    
    // block毁掉关闭PopViewController
    __weak DetailViewController *weakSelf = self;
    [self.popVC setPopBackWithBlock:^{
        [weakSelf.popVC removeFromParentViewController];
        [weakSelf.popVC.view removeFromSuperview];
        weakSelf.popVC.view = nil;
        weakSelf.popVC = nil;
    }];
}

- (IBAction)doBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
