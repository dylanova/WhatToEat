//
//  InFoodItemViewController.m
//  WhatToEat2
//
//  Created by Dylan Porter on 3/19/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import "InFoodItemViewController.h"
#import "SharedManager.h"
#import "EditDishViewController.h"

@interface InFoodItemViewController ()

@property (weak, nonatomic) IBOutlet UILabel *filterLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *typesLabel;
@property (weak, nonatomic) IBOutlet UITextView *ingredientsView;
@property (weak, nonatomic) IBOutlet UIButton *pinterestButton;

@end

@implementation InFoodItemViewController

- (IBAction)unwindToDish:(UIStoryboardSegue *)segue
{
    //AddRestaurantViewController *source = [segue sourceViewController];
    
}

- (IBAction) pinterestLink
{
    SharedManager *sharedManager = [SharedManager sharedManager];
    
    NSString *title = [NSString stringWithFormat: @"Pinterest %@ Recipe", sharedManager.selectedDish.name];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:@"Take me to Pinterest!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
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
    //Restaurant name label
    self.nameLabel.layer.borderColor = [UIColor blueColor].CGColor;
    self.nameLabel.layer.borderWidth = 4.0;
    self.nameLabel.layer.cornerRadius = 8;
    [self.nameLabel setTextAlignment:NSTextAlignmentCenter];
    self.nameLabel.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:18];
    
    //Restaurant type label
    self.typesLabel.layer.borderColor = [UIColor blueColor].CGColor;
    self.typesLabel.layer.borderWidth = 4.0;
    self.typesLabel.layer.cornerRadius = 8;
    [self.typesLabel setTextAlignment:NSTextAlignmentCenter];
    
    //Pinterest link
    //[self.pinterestButton setBackgroundColor:[UIColor lightGrayColor]];
    self.pinterestButton.layer.borderColor = [UIColor redColor].CGColor;
    self.pinterestButton.layer.borderWidth = 2.0f;
    self.pinterestButton.layer.cornerRadius = 8;
    //[self.pinterestButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    //Ingredients View
    self.ingredientsView.layer.borderColor = [UIColor blackColor].CGColor;
    self.ingredientsView.layer.borderWidth = 2.0;
    self.ingredientsView.layer.cornerRadius = 8;
    self.ingredientsView.editable = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    SharedManager *sharedManager = [SharedManager sharedManager];
    self.filterLabel.text = sharedManager.dishFilter;
    self.nameLabel.text   = sharedManager.selectedDish.name;
    self.typesLabel.text  = sharedManager.selectedDish.type;
    self.ingredientsView.text = sharedManager.selectedDish.ingredients;
    
    [self setupLabelVisuals];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    EditDishViewController *destination = [segue sourceViewController];
//}

@end
