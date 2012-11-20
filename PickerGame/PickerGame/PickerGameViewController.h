//
//  PickerGameViewController.h
//  PickerGame
//
//  Created by Yingyi Dai on 12-11-15.
//  Copyright (c) 2012年 SCUT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerGameViewController : UIViewController
        <UIPickerViewDelegate, UIPickerViewDataSource> 

@property (nonatomic, retain) IBOutlet UIPickerView *picker;
@property (nonatomic, retain) IBOutlet UILabel *winLabel;

@property (nonatomic, retain) NSArray *column1;
@property (nonatomic, retain) NSArray *column2;
@property (nonatomic, retain) NSArray *column3;
@property (nonatomic, retain) NSArray *column4;
@property (nonatomic, retain) NSArray *column5;

- (IBAction)spin:(id)sender;

@end
