//
//  OutListTableViewController.m
//  WhatToEat2
//
//  Created by Dylan Porter on 3/27/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import "OutListTableViewController.h"
#import "AddRestaurantViewController.h"
#import "SharedManager.h"
#import "Restaurant.h"

@interface OutListTableViewController ()

@end

@implementation OutListTableViewController

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    //AddRestaurantViewController *source = [segue sourceViewController];
    
}

- (NSMutableArray*)filter: (NSMutableArray*) origArray :(NSString*) filterString
{
    if( [filterString isEqual:@"All"] ){
        return origArray;
    }
    
    for( int i = 0; i < origArray.count; i++) {
        if( ((Restaurant*)[origArray objectAtIndex:i]).type == filterString)
            [_filteredArray addObject:origArray[i]];
    }
    return _filteredArray;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SharedManager *sharedManager = [SharedManager sharedManager];
    _filteredArray = [[NSMutableArray alloc] init];
    _filteredArray = [self filter:sharedManager.restaurantArray :sharedManager.restaurantFilter];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_filteredArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RestaurantCell" forIndexPath:indexPath];
    
     Restaurant *tmp = [_filteredArray objectAtIndex:indexPath.row];
     [cell.textLabel setText:tmp.name];
     [cell.detailTextLabel setText:tmp.type];
 
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //InFoodItemViewController *itemViewController = [[InFoodItemViewController alloc] initWithNibName:@"InFoodItemViewController" bundle:nil];

    // Pass the selected object to the new view controller.
    SharedManager *sharedManager = [SharedManager sharedManager];
    sharedManager.selectedRestaurant = [_filteredArray objectAtIndex:indexPath.row];

    // Push the view controller.
    //[self.navigationController pushViewController:itemViewController animated:YES];
}

@end
