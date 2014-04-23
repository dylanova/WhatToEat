//
//  Location.m
//  WhatToEat2
//
//  Created by Dylan Porter on 4/7/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import "Location.h"

@implementation Location

- (Location*)getTestLocation
{
    Location *myLocation = [[Location alloc] init];
    
    //Example: Austin, TX
    myLocation.latitude = 30.2861;
    myLocation.longitude = -97.7394;
    
    return myLocation;
}

@end
