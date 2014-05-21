//
//  DescriptionViewController.m
//  MCMS
//
//  Created by Ryan Tiltz on 5/20/14.
//  Copyright (c) 2014 Mathien. All rights reserved.
//


#import "SecondViewController.h"

@interface SecondViewController ()
@property (strong, nonatomic) IBOutlet UITextField *myNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *myDescriptionTextField;



@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myNameTextField.text = self.magicalCreatureToShow.name;
    self.myDescriptionTextField.text = self.magicalCreatureToShow.description;

    [self.myDescriptionTextField setEnabled:NO];
    [self.myNameTextField setEnabled:NO];
}
- (IBAction)myEditDoneButton:(UIButton *)sender {
    self.editing = !self.editing;
    if(self.editing)
    {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self.myDescriptionTextField setEnabled:YES];
        [self.myNameTextField setEnabled:YES];

    }
    else
    {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self.myDescriptionTextField setEnabled:NO];
        [self.myNameTextField setEnabled:NO];

        self.magicalCreatureToShow.name = self.myNameTextField.text;
        [self.myNameTextField resignFirstResponder];

        self.magicalCreatureToShow.description = self.myDescriptionTextField.text;
        [self.myDescriptionTextField resignFirstResponder];
    }
}
@end

