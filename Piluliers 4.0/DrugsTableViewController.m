//
//  DrugsTableViewController.m
//  Piluliers 4.0
//
//  Created by Stoeckli Michael, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "DrugsTableViewController.h"
#import "TimelineTableViewCell.h"
#import "DrugsTableViewCell.h"

@interface DrugsTableViewController ()

@end

@implementation DrugsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"drugs", nil);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //todo stoecklim: use custom cell for this use case later
    DrugsTableViewCell *cell = (DrugsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DrugsTableViewCell" forIndexPath:indexPath];
    //todo meumannu: set data from model
    cell.medicamentImage.image = [UIImage imageNamed:@"sandro"];
    cell.medicamentName.text = @"Medikament X";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

# pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //todo stoecklim: present detail view controller
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
