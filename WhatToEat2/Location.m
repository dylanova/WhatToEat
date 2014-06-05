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

#define kLongKey   @"kLatitudeKey"
#define kLatKey   @"kLongitudeKey"

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeFloat: _longitude forKey:kLongKey];
    [aCoder encodeFloat:_latitude forKey:kLatKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super init]))
    {
        _longitude = [aDecoder decodeFloatForKey:kLongKey];
        _latitude = [aDecoder decodeFloatForKey:kLatKey];
    }
    return self;
}

@end
