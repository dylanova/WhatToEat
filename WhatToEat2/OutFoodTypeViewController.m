//
//  OutFoodTypeViewController.m
//  WhatToEat2
//
//  Created by Dylan Porter on 3/19/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import "OutFoodTypeViewController.h"
#import "SharedManager.h"
#import "FoodTypes.h"

@interface OutFoodTypeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *listButton;
@property (weak, nonatomic) IBOutlet UIButton *idkButton;

@end

@implementation OutFoodTypeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setupLabelVisuals
{
    //List Button
    //[self.inButton setBackgroundColor:[UIColor lightGrayColor]];
    [self.listButton.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.listButton.layer setBorderWidth:2.0f];
    [self.listButton.layer setCornerRadius:8];
    [self.listButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    //IDK Button
    //[self.outButton setBackgroundColor:[UIColor lightGrayColor]];
    [self.idkButton.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.idkButton.layer setBorderWidth:2.0f];
    [self.idkButton.layer setCornerRadius:8];
    [self.idkButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *clouds = [UIImage imageNamed:@"Clouds"];
    [self.navigationController.navigationBar setBackgroundImage:clouds forBarMetrics:UIBarMetricsDefault];
    
    [self setupLabelVisuals];
}

- (IBAction) iDontKnow
{
    SharedManager *sharedManager = [SharedManager sharedManager];
    
    NSMutableArray *filteredArray = [[NSMutableArray alloc] init];
    filteredArray = [Restaurant filter:sharedManager.restaurantArray :sharedManager.restaurantFilter];
    if ([filteredArray count] > 0) {
        sharedManager.selectedRestaurant = filteredArray[arc4random_uniform([filteredArray count])];
        [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"IdkOutView"] animated:YES];
    }
    else {
        NSString *emptyCategory = [NSString stringWithFormat: @"No %@ Restaurants!", sharedManager.restaurantFilter];

        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:emptyCategory message:@"Try a different category" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertV didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    //go back a page
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    FoodTypes *myFoodTypes = [FoodTypes foodTypes];
    return myFoodTypes.typesArray.count;
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    FoodTypes *myFoodTypes = [FoodTypes foodTypes];
    return myFoodTypes.typesArray[row];
}

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    SharedManager *sharedManager = [SharedManager sharedManager];
    FoodTypes *myFoodTypes = [FoodTypes foodTypes];
    sharedManager.restaurantFilter = myFoodTypes.typesArray[row];
    return;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
