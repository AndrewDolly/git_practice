//
//  ViewController.m
//  MyBookClub
//
//  Created by andrew dahle on 4/1/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//


#import "AppDelegate.h"
#import "ViewController.h"
#import "PeopleViewController.h"
#import "People.h"
#import "Book.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *friends;
@property NSManagedObjectContext *moc;



@end

@implementation ViewController

- (void)viewDidLoad {

        [super viewDidLoad];

        self.moc = [AppDelegate appDelegate].managedObjectContext;
        [self loadFriends];
    }

    - (void)viewWillAppear:(BOOL)animated
    {
        [super viewWillAppear:animated];
        if (self.people)
        {
            self.navigationItem.rightBarButtonItem = nil;
        }else
        {
            self.navigationItem.leftBarButtonItem = nil;
        }

    }


    - (void)loadAdventurers {

        //this is going to look at every adventure obj and pull out only those obj where adventure.raids contains whatever raid we are talking about, like if we are looking at China this predicate is giong to go into adventure objects and see if it contains china and then include it if it does. If no raid present, then nothing included.
        if([self.people])
        {
            self.adventurers = [self.raid.adventurers allObjects];
            //how to know when you need things like reload data or just return or both?
            [self.tableView reloadData];
            return;
        }
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([Adventurer class])];

        self.adventurers = [self.moc executeFetchRequest:request error:nil];
        [self.tableView reloadData];
    }



    - (IBAction)onAddButtonTapped:(id)sender {
        UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"Add an adventurer" message:nil preferredStyle:UIAlertControllerStyleAlert];

        [alertcontroller addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            nil;
        }];

        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:@"Okay"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       UITextField *textField = alertcontroller.textFields.firstObject;
                                       Adventurer *adventurer = [NSEntityDescription
                                                                 insertNewObjectForEntityForName:@"Adventurer" inManagedObjectContext:self.moc];
                                       adventurer.name = textField.text;
                                       [self.moc save:nil];
                                       [self loadAdventurers];
                                   }];


        [alertcontroller addAction:okAction];

        [self presentViewController:alertcontroller animated:YES completion:^{
            nil;
        }];
    }

    - (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
    {
        return !self.raid; //Return yes, if there is no raid.
    }

    - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
    {
        TableViewController *raidsTableVC = segue.destinationViewController;

        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        Adventurer *adventurer = self.adventurers[indexPath.row];
        raidsTableVC.adventurer = adventurer;
    }


#pragma mark - Tableview Methods

    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    {
        return self.adventurers.count;
    }

    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"adventurerCell"];
        Adventurer *a = self.adventurers[indexPath.row];
        cell.textLabel.text = a.name;
        
        return cell;
    }
    
    - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
    {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
    - (IBAction)onDoneButtonTapped:(id)sender
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }

    

}

@end
