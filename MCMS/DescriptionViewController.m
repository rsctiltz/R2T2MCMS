//
//  DescriptionViewController.m
//  MCMS
//
//  Created by Ryan Tiltz on 5/20/14.
//  Copyright (c) 2014 Mathien. All rights reserved.
//

#import "DescriptionViewController.h"
#import "ViewController.h"

@interface DescriptionViewController ()

@property (strong, nonatomic) IBOutlet UIButton *onEditButtonPressed;
@property (strong, nonatomic) IBOutlet UITextView *myCreatureDescription;


@end

@implementation DescriptionViewController

- (void)viewDidLoad
    {
        [super viewDidLoad];

        NSLog(@"%@", _myCreatureDescription);

        //self.title = self.creature.name;
        //self.myCreatureDescription.text = self.creature.description;
        
    }
- (IBAction)onEditButtonPressed:(UIButton *)sender
{
    if([_onEditButtonPressed.currentTitle isEqualToString:@"Edit"])
    {
        [_onEditButtonPressed setTitle:@"Done" forState:UIControlStateNormal];

    }
    else
        [_onEditButtonPressed setTitle:@"Edit" forState:UIControlStateNormal];
    
}


@end

