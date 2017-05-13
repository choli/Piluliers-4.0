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
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TimelineDetailTableViewCell" forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Name of drug";
            cell.detailTextLabel.text = @"Medikament X";
            break;
        case 1:
            cell.textLabel.text = @"Form";
            cell.detailTextLabel.text = @"Pill";
            break;
        case 2:
            cell.textLabel.text = @"Package size / Quantity";
            cell.detailTextLabel.text = @"12 Pills";
            break;
        case 3:
            cell.textLabel.text = @"Frequency";
            cell.detailTextLabel.text = @"3 times daily";
            break;
        case 4:
            cell.textLabel.text = @"Duration";
            cell.detailTextLabel.text = @"6 weeks";
            break;
        case 5:
            cell.textLabel.text = @"Start date";
            cell.detailTextLabel.text = @"13.05.2017";
            break;
        case 6:
            cell.textLabel.text = @"Time";
            cell.detailTextLabel.text = @"08:00, 12:00, 18:00";
            break;
        case 7:
            cell.textLabel.text = @"Notes";
            cell.detailTextLabel.text = @"Before eating";
            break;
        default:
            cell.textLabel.text = @"NOT IMPLEMENTED";
            cell.detailTextLabel.text = @"NOT IMPLEMENTED";
            break;
    }
    cell.userInteractionEnabled = NO;
    return cell;
}

@end
