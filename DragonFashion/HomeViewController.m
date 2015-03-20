//
//  HomeViewController.m
//  DragonFashion
//
//  Created by andrew dahle on 3/17/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "HomeViewController.h"
#import "Dragon.h"
#import "ClothingDetailViewController.h"


@interface HomeViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *dragons;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    Dragon  *dragonOne = [Dragon new];
//    dragonOne.fullName = @"Smaug";
//    dragonOne.signatureClothingItem = @"High Heels";
//    Dragon *dragonTwo = [Dragon new];
//    dragonTwo.fullName = @"Spyro";
//    dragonTwo.signatureClothingItem = @"Pocket Protector";

    Dragon *dragonOne = [[Dragon alloc]initWithFullName:@"Smaug" andClothingItem:@"High Heels"];
    Dragon *dragonTwo = [[Dragon alloc]initWithFullName:@"Spyro" andClothingItem:@"Pocket Protector"];
    Dragon *dragonThree = [[Dragon alloc]initWithFullName:@"Trogdor" andClothingItem:@"Weird Glasses"];
    Dragon *dragonFour = [[Dragon alloc]initWithFullName:@"Ben" andClothingItem:@"Beard"];
    self.Dragons = [NSArray arrayWithObjects:dragonOne, dragonTwo, dragonThree, dragonFour, nil];

    for (Dragon *dragon in self.dragons) {
        NSLog(@"%@", dragon.fullName);
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DragonCell"];
    Dragon* dragon = [self.dragons objectAtIndex:indexPath.row];
    cell.textLabel.text = [self.dragons objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = dragon.signatureClothingItem;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dragons.count;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    Dragon* dragon = [self.dragons objectAtIndex:indexPath.row];
    ClothingDetailViewController *vc = segue.destinationViewController;
    vc.dragon = dragon;
    vc.title = dragon.fullName;
}


@end
