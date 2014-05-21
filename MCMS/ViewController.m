//
//  ViewController.m
//  MCMS
//
//  Created by teacher on 5/20/14.
//  Copyright (c) 2014 Mathien. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "DescriptionViewController.h"


@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *creaturesTableView;
@property NSString *addRowString;
@property NSMutableArray *textInputArray;
@property (strong, nonatomic) IBOutlet UITextField *myTextField;
@end

@implementation ViewController

- (void)viewDidLoad





{
    [super viewDidLoad];

    MagicalCreature *creature1 = [[MagicalCreature alloc]initWithFullName:@"Swamp Thing" description:@"Muck-encrusted Mockery of a Man"];
    MagicalCreature *creature2 = [[MagicalCreature alloc]initWithFullName:@"Bigfoot" description:@"Elusive Sasquatch"];
    MagicalCreature *creature3 = [[MagicalCreature alloc]initWithFullName:@"Loch Ness Monster" description:@"Nessie the Serpent of the Sea"];

    self.creatures = [NSMutableArray arrayWithObjects:creature1, creature2, creature3, nil];

    for (MagicalCreature *creature in self.creatures)
    {
        NSLog(@"creature: %@", creature);
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MagicalCreature *creatures = [self.creatures objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellID"];
    cell.textLabel.text = creatures.name;
    cell.detailTextLabel.text = creatures.description;
    return cell;
    //cell.textLabel.text = [self.textInputArray objectAtIndex:indexPath.row];
    //cell.textLabel.textColor = [UIColor blackColor];


}

- (IBAction)myCreatureAddButton:(id)sender
    {
        NSString *nospaces = [self.myTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

        if ([nospaces  isEqual: @""])
        {
            nil;
        }

        else
        {
            MagicalCreature *newCreature = [[MagicalCreature alloc]init];
            newCreature.name = self.myTextField.text;
            [self.creatures addObject:newCreature];
            [self.creaturesTableView reloadData];

            [self.myTextField resignFirstResponder];
            self.myTextField.text = nil;
            [self.creaturesTableView reloadData];
        }

    }

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UILabel *)sender
{
    NSIndexPath *selectedIndexPath = self.creaturesTableView.indexPathForSelectedRow;
    MagicalCreature *myCreatureDescription = [self.creatures objectAtIndex:selectedIndexPath.row];
    DescriptionViewController *descriptionViewController = segue.destinationViewController;
    descriptionViewController.creature = myCreatureDescription;

}


@end
