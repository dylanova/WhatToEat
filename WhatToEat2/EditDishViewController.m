//
//  EditDishViewController.m
//  WhatToEat2
//
//  Created by Dylan Porter on 7/20/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import "EditDishViewController.h"
#import "SharedManager.h"
#import "FoodTypes.h"

@interface EditDishViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UITextField *dishName;
@property (weak, nonatomic) IBOutlet UITextView *ingredients;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end

@implementation EditDishViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if( sender != self.doneButton) return;
    
    if(self.dishName.text.length > 0){
//        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString *documentsDirectory = [paths objectAtIndex:0];
//        NSString *restaurantArrayFileName = [documentsDirectory stringByAppendingPathComponent:@"dish.dat"];
//        
//        SharedManager *sharedManager = [SharedManager sharedManager];
//        
//        Dish *newDish = [[Dish alloc] init];
//        newDish.name = self.dishName.text;
//        newDish.type = _newDishType;
//        //newDish.menu = [NSURL URLWithString:self.menuText.text];
//        
//        [sharedManager.restaurantArray addObject:newDish];
//        
//        [NSKeyedArchiver archiveRootObject:sharedManager.restaurantArray toFile:restaurantArrayFileName];
        return;
    }
}

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
    //Ingredients View
    self.ingredients.layer.borderColor = [UIColor blackColor].CGColor;
    self.ingredients.layer.borderWidth = 2.0;
    self.ingredients.layer.cornerRadius = 8;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    SharedManager *sharedManager = [SharedManager sharedManager];
    self.dishName.text   = sharedManager.selectedDish.name;
    self.ingredients.text = sharedManager.selectedDish.ingredients;
    
    FoodTypes *myFoodTypes = [FoodTypes foodTypes];
    NSUInteger typeIndex = [myFoodTypes.typesArray indexOfObject:sharedManager.selectedDish.type];
    [self.picker selectRow:typeIndex inComponent:0 animated:YES];

    
    [self setupLabelVisuals];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    FoodTypes *myFoodTypes = [FoodTypes foodTypes];
    _dishType = myFoodTypes.typesArray[row];
    return;
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
