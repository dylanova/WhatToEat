//
//  SharedManager.h
//  WhatToEat2
//
//  Created by Dylan Porter on 3/29/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dish.h"
#import "Restaurant.h"

@interface SharedManager : NSObject {

    /* Dish Shared Objects */
    NSString *dishFilter;
    NSMutableArray  *dishArray;
    Dish *selectedDish;
    
    /* Restaurant Shared Objects */
    NSString *restaurantFilter;
    NSMutableArray  *restaurantArray;
    Restaurant *selectedRestaurant;
}

@property (nonatomic, retain) NSString *dishFilter;
@property (nonatomic, retain) NSMutableArray *dishArray;
@property (nonatomic, retain) Dish *selectedDish;

@property (nonatomic, retain) NSString *restaurantFilter;
@property (nonatomic, retain) NSMutableArray *restaurantArray;
@property (nonatomic, retain) Restaurant *selectedRestaurant;

+ (id)sharedManager;

@end
