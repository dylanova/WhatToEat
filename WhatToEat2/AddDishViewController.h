//
//  AddDishViewController.h
//  WhatToEat2
//
//  Created by Dylan Porter on 3/27/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddDishViewController : UIViewController
    <UIPickerViewDelegate, UIPickerViewDataSource>

@property NSString *addDishType;

@end
