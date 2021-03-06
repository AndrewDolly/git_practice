//
//  ViewController.m
//  LostCharacters
//
//  Created by andrew dahle on 4/1/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "Character.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property NSManagedObjectContext *moc;
@property NSArray *lostCharacters;
@property (weak, nonatomic) IBOutlet UITableView *charactersTableView;

@end

@implementation ViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDelegete = [[UIApplication sharedApplication] delegate];
    self.moc = appDelegete.managedObjectContext;
    //saves all of them by adding this line
    [self load];

}

- (void) load {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Character"];
    self.lostCharacters = [self.moc executeFetchRequest:request error:nil];

    if (self.lostCharacters.count == 0) {
        [self getPlistData];
        [self.charactersTableView reloadData];
    }
}

- (void) getPlistData {

    NSString *path = [[NSBundle mainBundle] pathForResource:@"lost" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];

    for (NSDictionary *dict in array) {
        NSManagedObject *character = [NSEntityDescription insertNewObjectForEntityForName:@"Character" inManagedObjectContext:self.moc];
        [character setValue:dict[@"passenger"] forKey:@"passenger"];
        [character setValue:dict[@"actor"] forKey:@"actor"];

        //            NSLog(@"%@ playes %@ on the show", dict[@"actor"], dict[@"passenger"]);
        [self.moc save:nil];
    }
}

#pragma mark - TableView Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lostCharacters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSManagedObject *lostCharacter = self.lostCharacters[indexPath.row];
    CharacterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CharacterCell"];

    cell.textLabel.text = [lostCharacter valueForKey:@"passenger"];
    cell.detailTextLabel.text = [lostCharacter valueForKey:@"actor"];

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}










- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDelegete = [[UIApplication sharedApplication] delegate];
    self.moc = appDelegete.managedObjectContext;
    //saves all of them by adding this line
    [self load];
}

- (IBAction)addWarrior:(UITextField *)sender{
    NSManagedObject *warrior = [NSEntityDescription insertNewObjectForEntityForName:@"Warrior" inManagedObjectContext:self.moc];
    //note taht this for key value comes from the TroyStroyFour.xcdatamodel  attributes
    [warrior setValue:sender.text forKey:@"name"];
    //create random number and use that to populate key value
    int rand = arc4random()%10;
    [warrior setValue:[NSNumber numberWithInt:rand] forKey:@"prowess"];

    [self.moc save:nil];
    //relates to saveing the data:
    [self load];
    sender.text = @"";
    [sender resignFirstResponder];
}

- (IBAction)prowessToggle:(UIButton *)sender{
    self.toggled = !self.toggled;
    [self load];
}


- (void)load{
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Warrior"];
    //add in ability to sort
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSSortDescriptor *sortDescriptorTwo = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];

    if(self.toggled) {
        request.predicate = [NSPredicate predicateWithFormat:@"prowess <= 5"];
    }else{
        request.predicate = [NSPredicate predicateWithFormat:@"prowess >= 5"];
    }
    request.sortDescriptors = @[sortDescriptor, sortDescriptorTwo];
    self.warriors = [self.moc executeFetchRequest:request error:nil];
    [self.warriorsTableView reloadData];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.warriors.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSManagedObject *warrior = self.warriors[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    cell.textLabel.text = [warrior valueForKey:@"name"];
    cell.detailTextLabel.text = [[warrior valueForKey:@"prowess"] stringValue];
    return cell;
}

//Add in ability to delete:


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.warriors removeObjectAtIndex:indexPath.row];
//        [tableView reloadData];
//    }
//}





@end
