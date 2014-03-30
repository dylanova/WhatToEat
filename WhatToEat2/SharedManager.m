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
@synthesize restaurantFilter;
@synthesize restaurantArray;

#pragma mark Singleton Methods

+ (id)sharedManager {
    static SharedManager *mySharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mySharedManager = [[self alloc] init];
    });
    return mySharedManager;
}

- (id)init {
    if (self = [super init]) {
        dishFilter = @"Default Dish";
        Dish *tmpDish = [[Dish alloc] init];
        tmpDish.name = @"Spaghetti";
        tmpDish.types = NULL;
        tmpDish.ingredients = NULL;
        [dishArray addObject:tmpDish];
        
        restaurantFilter = @"Default Restaurant";
        Restaurant *tmpRestaurant = [[Restaurant alloc] init];
        [restaurantArray addObject:tmpRestaurant];

    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}


@end
