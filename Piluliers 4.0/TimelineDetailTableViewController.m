//
//  TimelineDetailTableViewController.m
//  Piluliers 4.0
//
//  Created by Stoeckli Michael, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "TimelineDetailTableViewController.h"
#import "UIColor+CustomColors.h"

@interface TimelineDetailTableViewController ()

@end

@implementation TimelineDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    //todo stoecklim: read from model
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Name of drug";
            cell.detailTextLabel.text = self.medicationData.title;
            break;
        case 1:
            cell.textLabel.text = @"Form";
            cell.detailTextLabel.text = self.medicationData.form;
            break;
        case 2:
            cell.textLabel.text = @"Package size / Quantity";
            cell.detailTextLabel.text = self.medicationData.quantity;
            break;
        case 3:
            cell.textLabel.text = @"Frequency";
            cell.detailTextLabel.text = self.medicationData.frequency;
            break;
        case 4:
            cell.textLabel.text = @"Duration";
            cell.detailTextLabel.text = self.medicationData.duration;
            break;
        case 5:
            cell.textLabel.text = @"Start date";
            cell.detailTextLabel.text = self.medicationData.startDate;
            break;
        case 6:
            cell.textLabel.text = @"Time";
            cell.detailTextLabel.text = self.medicationData.time;
            break;
        case 7:
            cell.textLabel.text = @"Notes";
            cell.detailTextLabel.text = self.medicationData.notes;
            break;
        default:
            cell.textLabel.text = @"NOT IMPLEMENTED";
            cell.detailTextLabel.text = @"NOT IMPLEMENTED";
            break;
    }
    cell.textLabel.textColor = [UIColor hackathonTabBarColor];
    cell.detailTextLabel.textColor = [UIColor hackathonAccentColor];
    cell.userInteractionEnabled = NO;
    return cell;
}

@end
