//
//  TimelineDetailTableViewController.m
//  Piluliers 4.0
//
//  Created by Stoeckli Michael, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "TimelineDetailTableViewController.h"

@interface TimelineDetailTableViewController ()

@end

@implementation TimelineDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.titleString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TimelineDetailTableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = @"Mein Titel";
    cell.detailTextLabel.text = @"Mein Detail";
    cell.userInteractionEnabled = NO;
    return cell;
}

@end
