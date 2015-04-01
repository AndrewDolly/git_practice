//
//  ViewController.m
//  SuperheroPedia
//
//  Created by andrew dahle on 3/23/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "SuperHero.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) NSArray *tableDataArray;
@property (weak, nonatomic) IBOutlet UITableView *superHeroTableView;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SuperHero retrieveSuperHeroesWithCompletion:^(NSArray *heroes) {
        self.tableDataArray = heroes;
    }];
}


- (void)setTableDataArray:(NSArray *)tableDataArray
{
    _tableDataArray = tableDataArray;
    [self.superHeroTableView reloadData];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableDataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SuperheroesID"];
    SuperHero *superHero = [self.tableDataArray objectAtIndex:indexPath.row];
    [superHero getImageDataWithCompletion:^(NSData *imageData, NSError *error) {
        cell.imageView.image = [UIImage imageWithData:imageData];
        [cell layoutSubviews];
    }];
    cell.textLabel.text = superHero.name;
    cell.detailTextLabel.text = superHero.textDescription;
    return cell;
}





@end
