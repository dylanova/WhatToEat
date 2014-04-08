//
//  Restaurant.h
//  WhatToEat2
//
//  Created by Dylan Porter on 3/29/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject <NSCoding>

@property NSString *name;
//@property NSMutableArray  *types;
@property NSString  *type;
//@property NSURL    *menu;
@property NSString *menu;

+ (BOOL)initTestArray: (NSMutableArray*)restaurantArray;

+ (NSMutableArray*)filter: (NSMutableArray*) origArray :(NSString*) filterString;

@end
