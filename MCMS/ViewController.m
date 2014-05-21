//
//  ViewController.m
//  MCMS
//
//  Created by teacher on 5/20/14.
//  Copyright (c) 2014 Mathien. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "SecondViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *myNameTextField;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UITextField *myDescriptionTextField;

@end

@implementation ViewController
- (IBAction)onAddButtonPressed:(id)sender {

    NSString *name = self.myNameTextField.text;
    NSString *description = self.myDescriptionTextField.text;

    MagicalCreature *currentCreatureToAdd = [[MagicalCreature alloc] initWithName:name andDescription:description];
    [self.creatures addObject:currentCreatureToAdd];
    [self.myTableView reloadData];
    self.myNameTextField.text = nil;
    self.myDescriptionTextField.text = nil;
    [self.myNameTextField resignFirstResponder];
    [self.myDescriptionTextField resignFirstResponder];

    
    
}

- (void)viewDidLoad

{
    [super viewDidLoad];

    MagicalCreature *creature1 = [[MagicalCreature alloc] initWithName:@"Swamp Thing" andDescription:@"Mucky Mossy Man"];
    MagicalCreature *creature2 = [[MagicalCreature alloc] initWithName:@"Bigfoot" andDescription:@"Elusive Sasquatch"];
    MagicalCreature *creature3 = [[MagicalCreature alloc] initWithName:@"LochNess Monster" andDescription:@"Nessie the Sea Serpent"];
    self.creatures = [NSMutableArray arrayWithObjects:creature1, creature2, creature3, nil];
}

-(void) viewWillAppear:(BOOL)animated
{
    [self.myTableView reloadData];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellID"];
    MagicalCreature *currentCreature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = currentCreature.name;
    cell.detailTextLabel.text = currentCreature.description;

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *selectedIndexPath = self.myTableView.indexPathForSelectedRow;
    MagicalCreature *currentCreature = [self.creatures objectAtIndex:selectedIndexPath.row];
    SecondViewController *nextViewController = segue.destinationViewController;
    nextViewController.magicalCreatureToShow = currentCreature;
    nextViewController.arrayPosition = selectedIndexPath.row;

    
}
@end
