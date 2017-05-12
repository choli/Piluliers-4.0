//
//  TimelineTableViewController.m
//  Piluliers 4.0
//
//  Created by Stoeckli Michael, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "TimelineTableViewController.h"
#import "TimelineTableViewCell.h"

@interface TimelineTableViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation TimelineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.navigationController.navigationBar setBarTintColor:[UIColor greenColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
    self.title = NSLocalizedString(@"timeline", nil);
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return NSLocalizedString(@"morning", nil);;
            break;
        case 1:
            return NSLocalizedString(@"midday", nil);;
            break;
        case 2:
            return NSLocalizedString(@"evening", nil);;
            break;
        default:
            return NSLocalizedString(@"night", nil);;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TimelineTableViewCell *cell = (TimelineTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TimelineTableViewCell" forIndexPath:indexPath];
    return cell;
}

# pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end