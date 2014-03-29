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
    NSString *restaurantFilter;
}

@property (nonatomic, retain) NSString *dishFilter;
@property (nonatomic, retain) NSString *restaurantFilter;

+ (id)sharedManager;

@end
