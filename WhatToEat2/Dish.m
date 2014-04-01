//
//  Dish.m
//  WhatToEat2
//
//  Created by Dylan Porter on 3/29/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import "Dish.h"
#import "FoodTypes.h"

@implementation Dish

+ (BOOL)initTestArray: (NSMutableArray*)dishArray {
    NSArray *testNames = [[self class] testNames];
    NSArray *testTypes = [[self class] testTypes];
    for( int i = 0; i < testNames.count; i++){
        Dish *tmpDish = [[Dish alloc] init];
        tmpDish.name = testNames[i];
        tmpDish.type = testTypes[i];
        [dishArray addObject:tmpDish];
    }
    return true;
}

+ (NSArray *)testNames {
    
    static NSArray *_testNames;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _testNames=@[@"Spaghetti",
                     @"Tacos",
                     @"Sandwitchs"];
    });
    return _testNames;
}

+ (NSArray *)testTypes {
    static NSArray *_testTypes;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _testTypes=@[@"Italian",
                     @"Mexican",
                     @"Healthy"];
    });
    return _testTypes;
}

@end
