//
//  ViewController.m
//  RainbowTable
//
//  Created by andrew dahle on 3/16/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property NSMutableArray *colors;
@property IBOutlet UITableView *colorTableView;

@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.colors = [NSMutableArray arrayWithObjects:
                   [UIColor redColor],
                   [UIColor orangeColor],
                   [UIColor yellowColor],
                   [UIColor greenColor],
                   [UIColor blueColor],
                   [UIColor blackColor],
                   [UIColor purpleColor], nil];

}
- (IBAction)onAddRandomColor:(id)sender {
    CGFloat red = (float)rand()/RAND_MAX;
    CGFloat green = (float)rand()/RAND_MAX;
    CGFloat blue = (float)rand()/RAND_MAX;
    UIColor *newColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    [self.colors addObject:newColor];
    [self.colorTableView reloadData];
}



# pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    {
    return self.colors.count;
    }

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ColorCellID"];
        cell.textLabel.text = [NSString stringWithFormat:@"Row %li", (long)indexPath.row];
        cell.backgroundColor = [self.colors objectAtIndex: indexPath.row];
        return cell;
        }

@end