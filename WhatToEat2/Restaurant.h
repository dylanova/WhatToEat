//
//  Restaurant.h
//  WhatToEat2
//
//  Created by Dylan Porter on 3/29/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject 

@property NSString *name;
//@property NSMutableArray  *types;
@property NSString  *type;
@property NSURL    *website;
@property NSURL    *menu;       /*might not be necessary*/

+ (BOOL)initTestArray: (NSMutableArray*)restaurantArray;

@end
