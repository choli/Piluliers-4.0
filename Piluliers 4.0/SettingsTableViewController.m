//
//  SettingsTableViewController.m
//  Piluliers 4.0
//
//  Created by Stoeckli Michael, IT133 on 13.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "SettingsTableViewController.h"
#import "EditDrugsTableViewCell.h"
#import "UIColor+CustomColors.h"

@interface SettingsTableViewController ()

@end

@implementation SettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    self.title = NSLocalizedString(@"settings", nil);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EditDrugsTableViewCell *cell = (EditDrugsTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"EditDrugsTableViewCell" forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            cell.inputTitle.text = @"Morning Time";
            cell.inputValue.text = @"08:15";
            break;
        case 1:
            cell.inputTitle.text = @"Midday Time";
            cell.inputValue.text = @"12:00";
            break;
        case 2:
            cell.inputTitle.text = @"Lunch Time";
            cell.inputValue.text = @"18:30";
            break;
        case 3:
            cell.inputTitle.text = @"Evening Time";
            cell.inputValue.text = @"22:45";
            break;
        default:
            break;
    }
    
    cell.inputTitle.textColor = [UIColor hackathonTabBarColor];
    cell.inputValue.textColor = [UIColor hackathonAccentColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
