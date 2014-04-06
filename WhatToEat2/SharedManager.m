//
//  SharedManager.m
//  WhatToEat2
//
//  Created by Dylan Porter on 3/29/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import "SharedManager.h"
#import "Dish.h"
#import "Restaurant.h"

@implementation SharedManager

@synthesize dishFilter;
@synthesize dishArray;
@synthesize selectedDish;
@synthesize restaurantFilter;
@synthesize restaurantArray;
@synthesize selectedRestaurant;

#pragma mark Singleton Methods

+ (id)sharedManager {
    static SharedManager *mySharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mySharedManager = [[self alloc] init];
    });
    return mySharedManager;
}

- (void) createDishArrayFromFile {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dishArrayFileName = [documentsDirectory stringByAppendingPathComponent:@"dish.dat"];

    NSData *data = [NSData dataWithContentsOfFile:dishArrayFileName];
    
    if( data != nil )
    {
        dishArray = [NSKeyedUnarchiver unarchiveObjectWithFile:dishArrayFileName];
    }
    else {
        //Array file didn't exist... create a new one
        dishArray = [[NSMutableArray alloc] init];
        
        //Fill with default values
        [Dish initTestArray:dishArray];
        [NSKeyedArchiver archiveRootObject:dishArray toFile:dishArrayFileName];
    }
}

- (void) createRestaurantArrayFromFile {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *restaurantArrayFileName = [documentsDirectory stringByAppendingPathComponent:@"restaurant.dat"];
    
    NSData *data = [NSData dataWithContentsOfFile:restaurantArrayFileName];
    
    if( data != nil )
    {
        restaurantArray = [NSKeyedUnarchiver unarchiveObjectWithFile:restaurantArrayFileName];
    }
    else {
        //Array file didn't exist... create a new one
        restaurantArray = [[NSMutableArray alloc] init];
        
        //Fill with default values
        [Restaurant initTestArray:restaurantArray];
        [NSKeyedArchiver archiveRootObject:restaurantArray toFile:restaurantArrayFileName];
    }
}

- (id)init {
    if (self = [super init]) {
        /* Dish Initializations */
        //dishFilter = @"Default Dish";
        dishFilter = @"All";
        
        selectedDish = [[Dish alloc] init];
        
        [self createDishArrayFromFile];
        
        /* Restaurant Initializations */
        //restaurantFilter = @"Default Restaurant";
        restaurantFilter = @"All";
        
        selectedRestaurant = [[Restaurant alloc] init];

        [self createRestaurantArrayFromFile];
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}


@end
