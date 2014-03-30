//
//  SharedManager.h
//  WhatToEat2
//
//  Created by Dylan Porter on 3/29/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SharedManager : NSObject {

    NSString *dishFilter;
    NSMutableArray  *dishArray;
    NSString *restaurantFilter;
    NSMutableArray  *restaurantArray;
}

@property (nonatomic, retain) NSString *dishFilter;
@property (nonatomic, retain) NSMutableArray *dishArray;
@property (nonatomic, retain) NSString *restaurantFilter;
@property (nonatomic, retain) NSMutableArray *restaurantArray;

+ (id)sharedManager;

@end
