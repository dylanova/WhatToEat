//
//  OutFoodItemViewController.h
//  WhatToEat2
//
//  Created by Dylan Porter on 3/27/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "POI.h"

@interface OutFoodItemViewController : UIViewController

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction) menuLink;

@end
