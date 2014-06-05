//
//  OutFoodItemViewController.m
//  WhatToEat2
//
//  Created by Dylan Porter on 3/27/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import "OutFoodItemViewController.h"
#import "SharedManager.h"
#import "Location.h"

@interface OutFoodItemViewController ()

@property (weak, nonatomic) IBOutlet UILabel *filterLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *typesLabel;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;

@end

@implementation OutFoodItemViewController

- (IBAction) menuLink
{
    SharedManager *sharedManager = [SharedManager sharedManager];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:sharedManager.selectedRestaurant.menu]];
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
    
    //Menu link
    [self.menuButton setBackgroundColor:[UIColor lightGrayColor]];
    [self.menuButton.layer setBorderColor:[[UIColor blueColor] CGColor]];
    [self.menuButton.layer setBorderWidth:2.0f];
    [self.menuButton.layer setCornerRadius:8];
    [self.menuButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    SharedManager *sharedManager = [SharedManager sharedManager];
    self.filterLabel.text = sharedManager.restaurantFilter;
    self.nameLabel.text = sharedManager.selectedRestaurant.name;
    self.typesLabel.text = sharedManager.selectedRestaurant.type;
    
    [self setupLabelVisuals];
}

- (void)viewDidAppear:(BOOL)animated
{
    SharedManager *sharedManager = [SharedManager sharedManager];
    Location *poi = sharedManager.selectedRestaurant.location;
    
    //Need to have this because
    //  POI.coordinate(lat,long) is read-only
    CLLocationCoordinate2D poiCoodinates;
    poiCoodinates.latitude = poi.latitude;
    poiCoodinates.longitude= poi.longitude;
    POI *poiAnnotation = [[POI alloc] initWithCoordinate:poiCoodinates];
    poiAnnotation.title = sharedManager.selectedRestaurant.name;
    poiAnnotation.subtitle = sharedManager.selectedRestaurant.type;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(poiCoodinates, 750, 750);
    
    [self.mapView setRegion:viewRegion animated:YES];
    [self.mapView addAnnotation:poiAnnotation];
    [self.mapView selectAnnotation:poiAnnotation animated:YES];
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
