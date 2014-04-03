//
//  AddDishViewController.m
//  WhatToEat2
//
//  Created by Dylan Porter on 3/27/14.
//  Copyright (c) 2014 Dylan Porter. All rights reserved.
//

#import "AddDishViewController.h"
#import "SharedManager.h"

@interface AddDishViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UITextField *dishText;
@end

@implementation AddDishViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if( sender != self.doneButton) return;
    
    if(self.dishText.text.length > 0){
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *dishArrayFileName = [documentsDirectory stringByAppendingPathComponent:@"dish.dat"];

        SharedManager *sharedManager = [SharedManager sharedManager];
        
        Dish *newDish = [[Dish alloc] init];
        newDish.name = self.dishText.text;
        
        [sharedManager.dishArray addObject:newDish];
        
        [NSKeyedArchiver archiveRootObject:sharedManager.dishArray toFile:dishArrayFileName];
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
