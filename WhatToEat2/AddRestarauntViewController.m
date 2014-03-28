//
//  AddRestarauntViewController.m
//  WhatToEat2
//
//  Created by Dylan Porter on 3/27/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import "AddRestarauntViewController.h"

@interface AddRestarauntViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UITextField *restarauntText;
@end

@implementation AddRestarauntViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if( sender != self.doneButton) return;
    
    if(self.restarauntText.text.length > 0){
        return;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
