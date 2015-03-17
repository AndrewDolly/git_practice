//
//  ViewController.m
//  MCMS
//
//  Created by andrew dahle on 3/17/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "HomeViewController.h"
#import "MagicalCreature.h"

@interface HomeViewController () <UITableViewDataSource, UITableViewDelegate>


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





@end
