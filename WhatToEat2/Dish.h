//
//  Dish.h
//  WhatToEat2
//
//  Created by Dylan Porter on 3/29/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dish : NSObject <NSCoding>

@property NSString *name;
//@property NSMutableArray  *types;
@property NSString *type;
@property NSMutableArray  *ingredients;

+ (BOOL)initTestArray: (NSMutableArray*)dishArray;

@end
