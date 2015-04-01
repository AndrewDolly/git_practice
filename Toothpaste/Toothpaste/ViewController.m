//
//  ViewController.m
//  Toothpaste
//
//  Created by andrew dahle on 3/26/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "ToothpastTableViewController.h"

#define kNSUserDefaultsLastSavedKey @"kNSUserDefaultsLastSavedKey"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray *adoredToothpaste;
@property (strong, nonatomic) IBOutlet UITableView *toothpastesTableView;
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self load];
    if (self.adoredToothpaste == nil) {
        self.adoredToothpaste = [NSMutableArray new];
    }
}


//we want to save the datat that comes back here, so we need to stub out 3 menthods - loadview meth, save meth, and somehting else..
-(NSURL *)documentsDirectory
{
    NSLog(@"directory = %@", [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject]);

    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
}

-(void)load
{
    NSURL *plist = [[self documentsDirectory] URLByAppendingPathComponent:@"Paste.plist"];
    self.adoredToothpaste = [NSMutableArray arrayWithContentsOfURL:plist];
}

-(void)save
{
    //used class method to get out of an object, did it for file manager too. This is called 'software patterns' - the singleton pattern where a class has only one instance of an object. The delegation pattern is also a software pattern. Singleton is a dangerous pattern to use though, leads to spaghetti code
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[NSDate date] forKey:kNSUserDefaultsLastSavedKey];
    [userDefaults synchronize];


    //plist is short for property list
    NSURL *plist = [[self documentsDirectory] URLByAppendingPathComponent:@"Paste.plist"];
    [self.adoredToothpaste writeToURL:plist atomically:YES];
}


-(IBAction)unwindFromAddToothpasteViewController:(UIStoryboardSegue *)segue
{
    ToothpastTableViewController *viewController = segue.sourceViewController;
    NSIndexPath *indexPath;

    [self.adoredToothpaste addObject:[viewController adoredToothpaste]];
    indexPath = [NSIndexPath indexPathForRow:self.adoredToothpaste.count - 1 inSection:0];
    [self.toothpastesTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.toothpastesTableView reloadData];
    [self save];
}

//need to add code to import whatever we selected from that screen that we want to bring back

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    cell.textLabel.text = self.adoredToothpaste[indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.adoredToothpaste.count;
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.adoredToothpaste removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
}




@end
