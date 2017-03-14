//
//  PopViewController.m
//  UISkeletonStoryboard
//
//  Created by kun shen on 2017/3/13.
//  Copyright © 2017年 kun shen. All rights reserved.
//

#import "PopViewController.h"

@interface PopViewController ()

- (IBAction)doBack:(id)sender;

@end

@implementation PopViewController

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
#pragma mark Block handle

- (void)setPopBackWithBlock:(PopBackBlock)popBackBlock {
    
    self.popBackBlock = popBackBlock;
}

#pragma mark -
#pragma mark Button functions

- (IBAction)doBack:(id)sender {
    
    if (self.popBackBlock) {
        self.popBackBlock();
    }
}

@end
