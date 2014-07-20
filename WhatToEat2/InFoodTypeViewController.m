//
//  InFoodTypeViewController.m
//  WhatToEat2
//
//  Created by Dylan Porter on 3/19/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import "InFoodTypeViewController.h"
#import "SharedManager.h"
#import "FoodTypes.h"

@interface InFoodTypeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *listButton;
@property (weak, nonatomic) IBOutlet UIButton *idkButton;

@end

@implementation InFoodTypeViewController

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
    
    [self setupLabelVisuals];
}

- (IBAction) iDontKnow
{
    SharedManager *sharedManager = [SharedManager sharedManager];
    
    NSMutableArray *filteredArray = [[NSMutableArray alloc] init];
    filteredArray = [Dish filter:sharedManager.dishArray :sharedManager.dishFilter];
    if ([filteredArray count] > 0) {
        sharedManager.selectedDish = filteredArray[arc4random_uniform([filteredArray count])];
        [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"IdkInView"] animated:YES];

    }
    else {
        NSString *emptyCategory = [NSString stringWithFormat: @"No %@ Dishes!", sharedManager.dishFilter];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:emptyCategory message:@"Try a different category" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
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
    sharedManager.dishFilter = myFoodTypes.typesArray[row];
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
