//
//  CTCMasterViewController.m
//  PropMemFun
//
//  Created by Constance Li on 7/29/14.
//  Copyright (c) 2014 gwrabbit. All rights reserved.
//

#import "CTCMasterViewController.h"

@interface CTCMasterViewController () {
    NSArray *_sushiTypes;
    NSString *_lastSushiSelected;
}

- (NSArray *)sushiTypes;
- (void)setSushiTypes:(NSArray *)sushiTypes;
- (NSString *)lastSushiSelected;
- (void)setLastSushiSelected:(NSString *)lastSushiSelected;

@end

@implementation CTCMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    _sushiTypes = [[NSArray alloc] initWithObjects:@"California Roll", @"Tuna Roll", @"Salmon Roll", @"Unagi Roll", @"Philadelphia Roll", @"Rainbow Roll", @"Vegetable Roll", @"Spider Roll", @"Shrimp Tempura Roll", @"Cucumber Roll", @"Yellowtail Roll", @"Spicy Tuna Roll", @"Avocado Roll", @"Scallop Roll", nil];
}

- (void)viewDidUnload
{
    [_sushiTypes release];
    self.sushiTypes = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_sushiTypes release];
    self.sushiTypes = nil;
    [_lastSushiSelected release];
    self.lastSushiSelected = nil;

    [super dealloc];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _sushiTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSString *sushiName = [_sushiTypes objectAtIndex:indexPath.row];
    NSString *sushiString = [NSString stringWithFormat:@"%d: %@", (int)indexPath.row, sushiName];
    cell.textLabel.text = sushiString;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *sushiName = [_sushiTypes objectAtIndex:indexPath.row];
    NSString *sushiString = [NSString stringWithFormat:@"%d: %@", (int)indexPath.row, sushiName];
    NSString *message = [NSString stringWithFormat:@"Last sushi: %@. Cur sushi:%@", _lastSushiSelected, sushiString];
    UIAlertView *alertView = [[[UIAlertView alloc] initWithTitle:@"Sushi Power!" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil] autorelease];
    [alertView show];
    [_lastSushiSelected release];
    self.lastSushiSelected = sushiString;
    [_lastSushiSelected retain];
}

- (NSArray *)sushiTypes
{
    return _sushiTypes;
}

- (void)setSushiTypes:(NSArray *)sushiTypes
{
    [sushiTypes retain];
    [_sushiTypes release];
    _sushiTypes = sushiTypes;
}

- (NSString *)lastSushiSelected
{
    return _lastSushiSelected;
}

- (void)setLastSushiSelected:(NSString *)lastSushiSelected
{
    [lastSushiSelected retain];
    [_lastSushiSelected release];
    _lastSushiSelected = lastSushiSelected;
}

@end
