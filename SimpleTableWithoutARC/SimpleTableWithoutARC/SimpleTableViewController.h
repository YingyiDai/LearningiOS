//
//  SimpleTableViewController.h
//  SimpleTable
//
//  Created by Yingyi Dai on 12-10-22.
//  Copyright (c) 2012年 SCUT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableViewController : UIViewController
    <UITabBarDelegate, UITableViewDataSource>
{
    NSArray *listData;
}

@property (nonatomic, retain) NSArray *listData;

@end
