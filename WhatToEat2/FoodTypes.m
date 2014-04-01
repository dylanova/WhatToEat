//
//  FoodTypes.m
//  WhatToEat2
//
//  Created by Dylan Porter on 3/31/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import "FoodTypes.h"

@implementation FoodTypes

+ (id)foodTypes {
    static FoodTypes *myFoodTypes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        myFoodTypes = [[self alloc] init];
    });
    return myFoodTypes;
}

- (id)init {
    if (self = [super init]) {
        _typesArray = @[@"All",
                       @"Mexican",
                       @"Italian",
                       @"American",
                       @"Seafood",
                       @"Salad",
                       @"Healthy",
                       @"Chicken",
                       @"Pork",
                       @"Beef",
                       @"Asian",
                       @"Breakfast"];
    }
    return self;
}

@end
