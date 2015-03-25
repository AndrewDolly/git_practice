//
//  ViewController.m
//  SuperheroPedia
//
//  Created by andrew dahle on 3/23/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property NSArray *superHeroes;
@property (weak, nonatomic) IBOutlet UITableView *superHeroTableView;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.superHeroes = [NSArray arrayWithObjects:
//                        [NSDictionary dictionaryWithObjectsAndKeys:
//                         @"Superman",@"name",
//                         [NSNumber numberWithInt:32],@"age",nil],
//                        [NSDictionary dictionaryWithObjectsAndKeys:
//                         @"Green Lantern", @"name",
//                         [NSNumber numberWithInt:28],@"age",nil],
//                         nil];

    NSURL *url = [NSURL URLWithString:@"http://s3.amazonaws.com/mobile-makers-lib/superheroes.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data,
                                               NSError *connectionError) {
                               self.superHeroes = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
                               NSLog(@"data Received");
                               [self.superHeroTableView reloadData];
    }];
    NSLog(@"data Requested");
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.superHeroes.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SuperheroesID"];
    NSDictionary *superHero = [self.superHeroes objectAtIndex:indexPath.row];
    NSURL *imageURL = [NSURL URLWithString:[superHero objectForKey:@"avatar_url"]];

    cell.textLabel.text = [superHero objectForKey:@"name"];
    cell.detailTextLabel.text = [superHero objectForKey:@"description"];
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageURL]];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    return cell;
}





@end
