//
//  ViewController.m
//  MCMS
//
//  Created by andrew dahle on 3/17/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "HomeViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface HomeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *creatureNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *superpowerTextField;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    MagicalCreature *creatureOne = [[MagicalCreature alloc] initWithFullName:@"Spider Man" andSuperPower:@"Web"];
    MagicalCreature *creatureTwo = [[MagicalCreature alloc] initWithFullName:@"Batman" andSuperPower:@"Drives fast"];
    MagicalCreature *creatureThree = [[MagicalCreature alloc] initWithFullName:@"Wonder Woman" andSuperPower:@"Flies fast"];

    self.creatures = [NSMutableArray arrayWithObjects:creatureOne, creatureTwo, creatureThree, nil];
}

#pragma mark --view add datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.creatures.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreatureCell"];
        cell.textLabel.text = [[self.creatures objectAtIndex:indexPath.row] name];
        cell.detailTextLabel.text = [[self.creatures objectAtIndex:indexPath.row] superPower];
        return cell;
    }

#pragma mark -IBAction

- (IBAction)addNewCreature:(UIButton *)sender
{


    // one of the textFields is empty
    if ([self.creatureNameTextField.text isEqualToString:@""] || [self.superpowerTextField.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!"
                                                        message:@"Both of fields are required!"
                                                        delegate:self
                                                        cancelButtonTitle:nil
                                                        otherButtonTitles:@"Ok", nil];
        [alert show];

    }
    else
    {

        MagicalCreature *newCreature = [[MagicalCreature alloc] initWithFullName:self.creatureNameTextField.text andSuperPower:self.superpowerTextField.text];

        // array add object
        [self.creatures addObject:newCreature];

        [self.tableView reloadData];

        [self.creatureNameTextField resignFirstResponder];

        // clear the textField when pressed Add
        self.creatureNameTextField.text = @"";
        self.superpowerTextField.text = @"";
    }

}

#pragma mark - prepare for segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    CreatureViewController *vc = segue.destinationViewController;
    vc.creature = creature;
    vc.title = creature.name;
    
}


@end
