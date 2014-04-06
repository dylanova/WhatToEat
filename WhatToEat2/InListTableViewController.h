//
//  InListTableViewController.h
//  WhatToEat2
//
//  Created by Dylan Porter on 3/19/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InListTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray* filteredArray;

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

@end
