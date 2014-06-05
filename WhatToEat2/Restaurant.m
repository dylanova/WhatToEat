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

+ (NSMutableArray*)filter: (NSMutableArray*) origArray :(NSString*) filterString
{
    if( [filterString isEqual:@"All"] ){
        return origArray;
    }
    
    NSMutableArray *filteredArray = [[NSMutableArray alloc] init];
    
    for( int i = 0; i < origArray.count; i++) {
        if( [((Restaurant*)[origArray objectAtIndex:i]).type isEqualToString:filterString] )
            [filteredArray addObject:origArray[i]];
    }
    return filteredArray;
}

+ (BOOL)initTestArray: (NSMutableArray*)restaurantArray {
    NSArray *testNames = [[self class] testNames];
    NSArray *testTypes = [[self class] testTypes];
    NSArray *testMenus = [[self class] testMenus];
    NSArray *testLocations = [[self class] testLocations];
    for( int i = 0; i < testNames.count; i++){
        Restaurant *tmpRestaurant = [[Restaurant alloc] init];
        tmpRestaurant.name = testNames[i];
        tmpRestaurant.type = testTypes[i];
        tmpRestaurant.menu = testMenus[i];
        tmpRestaurant.location = testLocations[i];
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

+ (NSArray *)testMenus {
    static NSArray *_testMenus;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _testMenus=@[@"http://www.mcalistersdeli.com/menu/classic-sandwiches",
                     @"http://www.chuys.com/#/menu",
                     @"https://www.peiwei.com/menu/menu.aspx"];
    });
    return _testMenus;
}

+ (NSArray *)testLocations {
    static NSArray *_testLocations;
    Location *mcAlistersLoc = [[Location alloc] init];
    mcAlistersLoc.latitude = 30.354979;
    mcAlistersLoc.longitude = -97.733070;
    Location *chuysLoc = [[Location alloc] init];
    chuysLoc.latitude = 30.418512;
    chuysLoc.longitude = -97.747855;
    Location *peiweiLoc = [[Location alloc] init];
    peiweiLoc.latitude = 30.446356;
    peiweiLoc.longitude = -97.789140;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _testLocations = [[NSArray alloc] initWithObjects:mcAlistersLoc, chuysLoc, peiweiLoc, nil];
    });
    return _testLocations;
}

#define kNameKey   @"kNameKey"
#define kTypeKey   @"kTypeKey"
#define kMenuKey   @"kMenuKey"
#define kLocKey    @"kLocKey"

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:kNameKey];
    [aCoder encodeObject:_type forKey:kTypeKey];
    [aCoder encodeObject:_menu forKey:kMenuKey];
    [aCoder encodeObject:_location forKey:kLocKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super init]))
    {
        _name = [aDecoder decodeObjectForKey:kNameKey];
        _type = [aDecoder decodeObjectForKey:kTypeKey];
        _menu = [aDecoder decodeObjectForKey:kMenuKey];
        _location = [aDecoder decodeObjectForKey:kLocKey];
    }
    return self;
}

@end
