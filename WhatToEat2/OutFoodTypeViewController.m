//
//  OutFoodTypeViewController.m
//  WhatToEat2
//
//  Created by Dylan Porter on 3/19/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import "OutFoodTypeViewController.h"
#import "SharedManager.h"

@interface OutFoodTypeViewController ()

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    _restaurantTypesArray = @[@"All",
                              @"Mexican",
                              @"Italian",
                              @"American",
                              @"Seafood",
                              @"Salad",
                              @"Healthy",
                              @"Chicken",
                              @"Pork",
                              @"Beef",
                              @"Asian",
                              @"Breakfast"];
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _restaurantTypesArray.count;
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _restaurantTypesArray[row];
}

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    SharedManager *sharedManager = [SharedManager sharedManager];
    sharedManager.restaurantFilter = _restaurantTypesArray[row];
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
