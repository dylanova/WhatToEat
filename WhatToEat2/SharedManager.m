//
//  SharedManager.m
//  WhatToEat2
//
//  Created by Dylan Porter on 3/29/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import "SharedManager.h"

@implementation SharedManager

@synthesize dishFilter;
@synthesize restaurantFilter;

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
        restaurantFilter = @"Default Restaurant";
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}


@end
