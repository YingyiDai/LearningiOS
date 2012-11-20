//
//  PickerGameViewController.m
//  PickerGame
//
//  Created by Yingyi Dai on 12-11-15.
//  Copyright (c) 2012年 SCUT. All rights reserved.
//

#import "PickerGameViewController.h"

@interface PickerGameViewController ()

@end

@implementation PickerGameViewController
@synthesize picker;
@synthesize winLabel;

@synthesize column1;
@synthesize column2;
@synthesize column3;
@synthesize column4;
@synthesize column5;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //load images
    UIImage *cloud = [UIImage imageNamed:@"cloud.png"];
    UIImage *search = [UIImage imageNamed:@"search.png"];
    UIImage *good = [UIImage imageNamed:@"good.png"];
    UIImage *favorite = [UIImage imageNamed:@"favorite.png"];
    UIImage *help = [UIImage imageNamed:@"help.png"];
    
    UIImageView *cloudView = [[UIImageView alloc] initWithImage:cloud];
    UIImageView *searchView = [[UIImageView alloc] initWithImage:search];
    UIImageView *goodView = [[UIImageView alloc] initWithImage:good];
    UIImageView *favoriteView = [[UIImageView alloc] initWithImage:favorite];
    UIImageView *helpView = [[UIImageView alloc] initWithImage:help];
    NSArray *imageViewArray = [[NSArray alloc] initWithObjects:cloudView, searchView, goodView, favoriteView, helpView, nil];
    
    
    for( int i=0; i<5; i++){
        //init imageview
        
        
        NSString *colName = [[NSString alloc] initWithFormat:@"column%d", i+1];
        [self setValue:imageViewArray forKey:colName];
        [colName release];
        
//        [imageViewArray release];
//        [cloudView release];
//        [searchView release];
//        [goodView release];
//        [favoriteView release];
//        [helpView release];
    }

    srandom(time(NULL));
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.picker = nil;
    self.winLabel = nil;
    self.column1 = nil;
    self.column2 = nil;
    self.column3 = nil;
    self.column4 = nil;
    self.column5 = nil;
}

-(void)dealloc
{
    [picker release];
    [winLabel release];
    [column1 release];
    [column2 release];
    [column3 release];
    [column4 release];
    [column5 release];
    
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)spin:(id)sender
{
    BOOL win = NO;
    int numInRow = 1;
    int lastVal = -1;
    
    for (int i=0; i<5; i++) {
        int newValue = random() % [self.column1 count];
        
        if (newValue == lastVal) {
            numInRow ++;
        }
        else {
            numInRow = 1;
        }
        
        lastVal = newValue;
        [picker selectRow:newValue inComponent:i animated:YES];
        [picker reloadComponent:i];
        if (numInRow >= 3) {
            win = YES; 
        }
    }
    
    if (win) {
        winLabel.text = @"WIN!!!";
    } 
    else {
        winLabel.text = @"";
    }
    
}


#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 5;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.column1 count];
}

#pragma mark -
#pragma mark Picker Delegate Methods
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    NSString *arrayName = [[NSString alloc] initWithFormat:@"column%d", component+1];
    NSArray *array = [self valueForKey:arrayName];
    [arrayName release];
    return [array objectAtIndex:row];
}


@end
