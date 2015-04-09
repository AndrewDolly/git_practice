//
//  PeopleViewController.m
//  MyBookClub
//
//  Created by andrew dahle on 4/1/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "PeopleViewController.h"
#import "ViewController.h"
#import "People.h"

@interface PeopleViewController ()
@property NSArray *potentialFriendsArray;
@property People *user;


@end

@implementation PeopleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadPeople];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    People *person = [self.potentialFriendsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = person.name;
    if ([self.user.friends containsObject:person])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.potentialFriendsArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    People *selectedPerson = [self.potentialFriendsArray objectAtIndex:indexPath.row];
    if ([self.user.friends containsObject:selectedPerson])
    {
//        [self.user removeFriendsObject:selectedPerson];
    }
    else
    {
//        [self.user addFriendsObject:selectedPerson];
    }
    [self.context save:nil];
    [self.tableView reloadData];
}

- (void)loadPeople
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:[People description]];
    request.predicate = [NSPredicate predicateWithFormat:@"name != %@", @"User"];
    self.potentialFriendsArray = [self.context executeFetchRequest:request error:nil];

    //If there are no people in Core Data, read people in from JSON
    if (self.potentialFriendsArray.count == 0)
    {
        [self loadDataFromJSON];
    }

    request.predicate = [NSPredicate predicateWithFormat:@"name == %@", @"User"];
    NSArray *userArray = [self.context executeFetchRequest:request error:nil];
    self.user = [userArray firstObject];
    [self.tableView reloadData];
}

- (void)loadDataFromJSON
{
    NSMutableArray *tempArray = [NSMutableArray new];
    NSURL *url = [NSURL URLWithString:@"http://s3.amazonaws.com/mobile-makers-assets/app/public/ckeditor_assets/attachments/18/friends.json"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

    People *user = [NSEntityDescription insertNewObjectForEntityForName:[People description] inManagedObjectContext:self.context];
    user.name = @"User";
    for (NSString *personName in json)
    {
        People *newPerson = [NSEntityDescription insertNewObjectForEntityForName:[People description] inManagedObjectContext:self.context];
        newPerson.name = personName;
        [tempArray addObject:newPerson];
    }
    self.potentialFriendsArray = tempArray;
    [self.context save:nil];
}



@end
