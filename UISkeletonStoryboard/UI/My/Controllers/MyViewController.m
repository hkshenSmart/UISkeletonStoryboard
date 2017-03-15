//
//  MyViewController.m
//  UISkeletonStoryboard
//
//  Created by kun shen on 2017/3/13.
//  Copyright © 2017年 kun shen. All rights reserved.
//

#import "MyViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface MyViewController ()

- (IBAction)doLogin:(id)sender;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self localNotification];
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

#pragma mark
#pragma mark - UNNotificationRequest 本地通知

- (void)localNotification {
    
    // 创建通知内容
    UNMutableNotificationContent *mutableNotificationContent = [[UNMutableNotificationContent alloc] init];
    mutableNotificationContent.title = @"申怀坤本地通知";
    mutableNotificationContent.subtitle = @"天下事";
    mutableNotificationContent.body = @"合久必分，分久必合";
    mutableNotificationContent.badge = @4;
    
    // 设置通知附件内容
    /*
    NSString *path = [[NSBundle mainBundle] pathForResource:@"" ofType:@""];
    NSError *error = nil;
    UNNotificationAttachment *notificationAttachment = [UNNotificationAttachment attachmentWithIdentifier:@"hkshen" URL:[NSURL URLWithString:@""] options:nil error:&error];
    if (error) {
        NSLog(@"attachment error");
    }
    mutableNotificationContent.attachments = @[notificationAttachment];
    */
     
    // 触发模式
    UNTimeIntervalNotificationTrigger *timeIntervalNotificationTrigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];
    
    // 设置UNNotificationRequest
    UNNotificationRequest *notificationRequest = [UNNotificationRequest requestWithIdentifier:@"hkshenRequest" content:mutableNotificationContent trigger:timeIntervalNotificationTrigger];
    
    // 把通知加到UNUserNotificationCenter，到指定触发点会被触发
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:notificationRequest withCompletionHandler:^(NSError * _Nullable error) {
        
    }];
}

#pragma mark -
#pragma mark Button functions

- (IBAction)doLogin:(id)sender {
    
    // 弹出有导航栏的模态视图
    [self performSegueWithIdentifier:@"gotoLoginNavigationController" sender:self];
}

@end
