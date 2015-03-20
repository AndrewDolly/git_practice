//
//  ViewController.m
//  Deprocrastinator
//
//  Created by andrew dahle on 3/16/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *addTextField;

@property NSMutableArray *taskArray;
@property NSIndexPath *taskIndexPath;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.taskArray = [NSMutableArray arrayWithObjects:@"item 1", @"item 2", @"item 3", @"item 4", nil];
}
//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath: (NSIndexPath *) indexPath{
//    if (editingStyle == UI)
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.taskArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ToDoCell" forIndexPath:indexPath];
    cell.textLabel.text = [self.taskArray objectAtIndex:indexPath.row];
    return cell;
}

- (IBAction)onAddButtonPressed:(UIButton *)sender {
    if (![self.addTextField.text isEqualToString:@""])
    {
        [self.taskArray addObject:self.addTextField.text];
        [self.tableView reloadData];
        self.addTextField.text = @"";
        [self.addTextField resignFirstResponder];
    }
    else
    {
        [sender setEnabled:YES];
    }
}


@end
