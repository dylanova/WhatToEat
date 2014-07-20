//
//  InOrOutViewController.m
//  WhatToEat2
//
//  Created by Dylan Porter on 3/19/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import "InOrOutViewController.h"

@interface InOrOutViewController ()

@property (weak, nonatomic) IBOutlet UIButton *inButton;
@property (weak, nonatomic) IBOutlet UIButton *outButton;

@end

@implementation InOrOutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setupLabelVisuals
{
    //In Button
    //[self.inButton setBackgroundColor:[UIColor lightGrayColor]];
    [self.inButton.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.inButton.layer setBorderWidth:2.0f];
    [self.inButton.layer setCornerRadius:8];
    [self.inButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    //Out Button
    //[self.outButton setBackgroundColor:[UIColor lightGrayColor]];
    [self.outButton.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.outButton.layer setBorderWidth:2.0f];
    [self.outButton.layer setCornerRadius:8];
    [self.outButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupLabelVisuals];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
