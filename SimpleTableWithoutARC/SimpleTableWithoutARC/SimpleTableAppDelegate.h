//
//  SimpleTableAppDelegate.h
//  SimpleTableWithoutARC
//
//  Created by Yingyi Dai on 12-10-22.
//  Copyright (c) 2012年 SCUT. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SimpleTableViewController;

@interface SimpleTableAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SimpleTableViewController *viewController;

@end
