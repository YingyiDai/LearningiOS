//
//  SimpleTableViewController.m
//  SimpleTable
//
//  Created by Yingyi Dai on 12-10-22.
//  Copyright (c) 2012年 SCUT. All rights reserved.
//

#import "SimpleTableViewController.h"

@interface SimpleTableViewController ()

@end

@implementation SimpleTableViewController
@synthesize listData = _listData;

- (void)viewDidLoad
{
    NSArray *array = [[NSArray alloc] initWithObjects:@"Sleepy", @"Sneepy",
                      @"Bashful", @"Happy", nil];
    self.listData = array;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    self.listData = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
    }
    
    NSInteger row = [indexPath row];
    cell.textLabel.text = [_listData objectsAtIndexes:row];
    return cell;
}

@end
