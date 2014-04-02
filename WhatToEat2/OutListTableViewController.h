//
//  OutListTableViewController.h
//  WhatToEat2
//
//  Created by Dylan Porter on 3/27/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OutListTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray* filteredArray;

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

- (NSMutableArray*)filter: (NSMutableArray*) origArray :(NSString*) filterString;

@end
