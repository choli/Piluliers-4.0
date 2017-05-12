//
//  TimelineTableViewController.m
//  Piluliers 4.0
//
//  Created by Stoeckli Michael, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "TimelineTableViewController.h"
#import "TimelineTableViewDataSource.h"
#import "TimelineTableViewDelegate.h"

@interface TimelineTableViewController ()

@end

@implementation TimelineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TimelineTableViewDataSource *dataSource = [TimelineTableViewDataSource new];
    self.tableView.dataSource = dataSource;
    TimelineTableViewDelegate *delegate = [TimelineTableViewDelegate new];
    self.tableView.delegate = delegate;
    [self.navigationController.navigationBar setBarTintColor:[UIColor greenColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
    self.title = NSLocalizedString(@"timeline", nil);
    self.tableView.backgroundColor = [UIColor blueColor];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
