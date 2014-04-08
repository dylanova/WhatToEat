//
//  OutFoodItemViewController.m
//  WhatToEat2
//
//  Created by Dylan Porter on 3/27/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import "OutFoodItemViewController.h"
#import "SharedManager.h"

@interface OutFoodItemViewController ()

@property (weak, nonatomic) IBOutlet UILabel *filterLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *typesLabel;
@property (weak, nonatomic) IBOutlet UILabel *websiteLabel;
@property (weak, nonatomic) IBOutlet UILabel *menuLabel;

@end

@implementation OutFoodItemViewController

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
    SharedManager *sharedManager = [SharedManager sharedManager];
    self.filterLabel.text = sharedManager.restaurantFilter;
    self.nameLabel.text = sharedManager.selectedRestaurant.name;
    self.typesLabel.text = sharedManager.selectedRestaurant.type;
    self.menuLabel.text = sharedManager.selectedRestaurant.menu;
    //self.menuLabel.text = [sharedManager.selectedRestaurant.menu absoluteString];
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
