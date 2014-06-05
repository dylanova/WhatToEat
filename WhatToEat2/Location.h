//
//  Location.h
//  WhatToEat2
//
//  Created by Dylan Porter on 4/7/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject <NSCoding>

@property (nonatomic) float latitude;
@property (nonatomic) float longitude;

- (Location*)getTestLocation;

@end
