//
//  ViewController.m
//  AssessmentTwo
//
//  Created by andrew dahle on 3/20/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "CityDetailViewController.h"
#import "CustomCity.h"


@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray *cities;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
//add tablieview of cities to array

    CustomCity *cityOne = [[CustomCity alloc] initWithName:@"San Fran" stateProv:@"CA"];
    CustomCity *cityTwo = [[CustomCity alloc] initWithName:@"London" stateProv:@"UK"];
    CustomCity *cityThree = [[CustomCity alloc] initWithName:@"Minneapolis" stateProv:@"MN"];
    CustomCity *cityFour = [[CustomCity alloc] initWithName:@"Owatonna" stateProv:@"MN"];

    self.cities = [NSMutableArray arrayWithObjects:cityOne, cityTwo, cityThree, cityFour, nil];

    for (CustomCity *city in self.cities)
    {
        NSLog(@"%@, %@", city.name, city.stateProv);
    }
}
-(void) viewWillAppear:(BOOL)animated

{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

//sets rows to be equal to number of cities added to array
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.cities count];
}

//not showing img or state right now...trying to figure that out!
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityID"];

    CustomCity *city = [self.cities objectAtIndex:indexPath.row];

    cell.imageView.image = [UIImage imageNamed:@"city.name"];
    cell.textLabel.text = [NSString stringWithFormat:@"City: %@", city.name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"State: %@", city.stateProv];
    return cell;
}

//ability to swipe and delete specific row
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.cities removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
}

//segue when you click on city brings you to CityDetailVC
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CityDetailViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    CustomCity *city = [self.cities objectAtIndex:indexPath.row];
    vc.city = city;
}


//    City *sanFran = [[City alloc] initWithName:@"SanFran" stateProv:@"CA"];




@end
