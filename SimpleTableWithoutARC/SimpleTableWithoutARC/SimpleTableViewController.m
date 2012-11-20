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
@synthesize listData;

- (void)viewDidLoad
{
    NSArray *array = [[NSArray alloc] initWithObjects:@"Sleepy", @"Sneepy",
                      @"Bashful", @"Happy", nil];
    self.listData = array;
    
    [array release];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    self.listData = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)dealloc
{
    [listData release];
    [super dealloc];
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
    
    static NSString *NoStarIdentifier = @"NoStarIdentifier";
    UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:NoStarIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
    }
    
    if (cell2 == nil) {
        cell2 = [[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NoStarIdentifier];
    }   
    
    UIImage *image = [UIImage imageNamed:@"star_fav.png"];
    cell.imageView.image = image;
    
    cell2.detailTextLabel.text = @"detail";
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [listData objectAtIndex:row];
    cell2.textLabel.text = [listData objectAtIndex:row];
    
    if (row < 2) {
        return cell2;
    }
    else 
        return cell;
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row] > 0) {
        return 2;
    }
    else {
        return 0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    
    if (row == 0) {
        return nil; 
    }
    
    return indexPath;
}

- (NSInteger)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    NSUInteger row = [indexPath row];
    NSString *rowValue = [listData objectAtIndex:row];
    
    NSString *message = [[NSString alloc] initWithFormat:@"You selected %@", rowValue];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Row Selected!" message:message delegate:nil cancelButtonTitle:@"Yes i did" otherButtonTitles:nil];
    
    [alert show];
    
    [message release];
    [alert release];
    
}
@end
