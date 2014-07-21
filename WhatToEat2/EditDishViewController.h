//
//  EditDishViewController.h
//  WhatToEat2
//
//  Created by Dylan Porter on 7/20/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditDishViewController : UIViewController
    <UIPickerViewDelegate, UIPickerViewDataSource>

@property NSString *dishType;

@end
