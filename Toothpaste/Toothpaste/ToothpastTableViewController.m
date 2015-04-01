//
//  ToothpastTableViewController.m
//  Toothpaste
//
//  Created by andrew dahle on 3/26/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ToothpastTableViewController.h"
@interface ToothpastTableViewController ()
@property NSArray *toothpastes;
@end



@implementation ToothpastTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];


    NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com/content.mobilemakers/toothpastes.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.toothpastes = [NSArray new];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        self.toothpastes = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
        [self.tableView reloadData];
    }];
}

-(NSString *)adoredToothpaste {
    NSInteger row = self.tableView.indexPathForSelectedRow.row;
    return self.toothpastes[row];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.toothpastes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ToothpasteCell" forIndexPath:indexPath];
    cell.textLabel.text = [self.toothpastes objectAtIndex:indexPath.row];
    return cell;
}



@end
