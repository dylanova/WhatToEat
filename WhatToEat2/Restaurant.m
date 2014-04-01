//
//  Restaurant.m
//  WhatToEat2
//
//  Created by Dylan Porter on 3/29/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import "Restaurant.h"
#import "FoodTypes.h"

@implementation Restaurant

+ (BOOL)initTestArray: (NSMutableArray*)restaurantArray {
    NSArray *testNames = [[self class] testNames];
    NSArray *testTypes = [[self class] testTypes];
    for( int i = 0; i < testNames.count; i++){
        Restaurant *tmpRestaurant = [[Restaurant alloc] init];
        tmpRestaurant.name = testNames[i];
        tmpRestaurant.type = testTypes[i];
        [restaurantArray addObject:tmpRestaurant];
    }
    return true;
}

+ (NSArray *)testNames {
    
    static NSArray *_testNames;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _testNames=@[@"McAlister's",
                     @"Chuy's",
                     @"Pei Wei"];
    });
    return _testNames;
}

+ (NSArray *)testTypes {
    static NSArray *_testTypes;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _testTypes=@[@"American",
                     @"Mexican",
                     @"Asian"];
    });
    return _testTypes;
}

@end
