//
//  POI.m
//  WhatToEat2
//
//  Created by Dylan Porter on 6/4/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import "POI.h"

@implementation POI

@synthesize coordinate;
@synthesize subtitle;
@synthesize title;

- (id) initWithCoordinate:(CLLocationCoordinate2D)coords{
    self = [super init];
    
    if (self != nil)
        coordinate = coords;
    
    return self;
}

@end
