//
//  AppDelegate.m
//  UISkeletonStoryboard
//
//  Created by kun shen on 2017/3/13.
//  Copyright © 2017年 kun shen. All rights reserved.
//

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate ()
<
UNUserNotificationCenterDelegate
>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        //iOS10特有
        UNUserNotificationCenter *userNotificationCenter = [UNUserNotificationCenter currentNotificationCenter];
        userNotificationCenter.delegate = self;
        
        [userNotificationCenter requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert) completionHandler:^(BOOL granted, NSError * _Nullable error) {
            
            if (granted) {
                // 用户点击了允许
                [userNotificationCenter getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
                    NSLog(@"%@", settings);
                }];
            }
            else {
                // 用户点击了不允许
                NSLog(@"通知注册失败");
            }
        }];
    }
    else if ([[UIDevice currentDevice].systemVersion floatValue] > 8.0) {
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert) categories:nil]];
    }
    else {
        // 低于8.0
        //[application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    }
    
    // 这次获得device Token
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(nonnull NSData *)deviceToken {
    
    NSLog(@"getted deviceToken.");
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(nonnull NSError *)error {
    
    NSLog(@"getted deviceToken error.");
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo {
    
    NSLog(@"iOS6以下系统收到通知.");
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler {
    
    NSLog(@"iOS7以上收到通知.");
    completionHandler(UIBackgroundFetchResultNewData);
}

#pragma mark
#pragma mark - UNUserNotificationCenterDelegate

// iOS10 收到通知
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler __IOS_AVAILABLE(10.0) __TVOS_AVAILABLE(10.0) __WATCHOS_AVAILABLE(3.0) {
    
    NSDictionary *userInfoDict = notification.request.content.userInfo;
    UNNotificationRequest *notificationRequest = notification.request; // 收到推送的请求
    UNNotificationContent *notificationContent = notification.request.content; // 收到推送的消息内容
    NSNumber *badge = notificationContent.badge; // 推送消息的脚标
    NSString *bodyStr = notificationContent.body; // 推送消息体
    UNNotificationSound *notificationSound = notificationContent.sound; // 推送消息声音
    NSString *subtitleStr = notificationContent.subtitle; // 推送消息副标题
    NSString *titleStr = notificationContent.title; // 推送消息的标题
    
    if ([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        
        NSLog(@"这是远程通知.");
    }
    else {
        NSLog(@"本地通知.");
    }
    NSLog(@"userInfoDict:%@\nnotificationRequest:%@\nnotificationContent:%@\nbadge:%@\nbodyStr:%@\nnotificationSound:%@\nsubtitleStr:%@\ntitleStr:%@", userInfoDict, notificationRequest, notificationContent, badge, bodyStr, notificationSound, subtitleStr, titleStr);
    
    // 需要执行这个block，选择是否提醒用户，有badge、sound、alert三种类型可以设置
    completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge | UNNotificationPresentationOptionSound);
}

//通知的点击事件
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)())completionHandler __IOS_AVAILABLE(10.0) __WATCHOS_AVAILABLE(3.0) __TVOS_PROHIBITED {
    
    NSDictionary *userInfoDict = response.notification.request.content.userInfo;
    UNNotificationRequest *notificationRequest = response.notification.request; // 收到推送的请求
    UNNotificationContent *notificationContent = notificationRequest.content; // 收到推送的消息内容
    NSNumber *badge = notificationContent.badge; // 推送消息的脚标
    NSString *bodyStr = notificationContent.body; // 推送消息体
    UNNotificationSound *notificationSound = notificationContent.sound; // 推送消息声音
    NSString *subtitleStr = notificationContent.subtitle; // 推送消息副标题
    NSString *titleStr = notificationContent.title; // 推送消息的标题
    
    if ([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        
        NSLog(@"这是远程通知.");
    }
    else {
        NSLog(@"本地通知.");
    }
    NSLog(@"userInfoDict:%@\nnotificationRequest:%@\nnotificationContent:%@\nbadge:%@\nbodyStr:%@\nnotificationSound:%@\nsubtitleStr:%@\ntitleStr:%@", userInfoDict, notificationRequest, notificationContent, badge, bodyStr, notificationSound, subtitleStr, titleStr);
    
    completionHandler();
}


@end
