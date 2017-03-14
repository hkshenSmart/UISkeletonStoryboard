//
//  PopViewController.h
//  UISkeletonStoryboard
//
//  Created by kun shen on 2017/3/13.
//  Copyright © 2017年 kun shen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^PopBackBlock)();

@interface PopViewController : UIViewController

@property (copy, nonatomic) PopBackBlock popBackBlock;

- (void)setPopBackWithBlock:(PopBackBlock)popBackBlock;

@end
