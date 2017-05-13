//
//  EditDrugsTableViewController.m
//  Piluliers 4.0
//
//  Created by Stoeckli Michael, IT133 on 13.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "EditDrugsTableViewController.h"
#import "EditDrugsTableViewCell.h"
#import "UIColor+CustomColors.h"

@interface EditDrugsTableViewController ()

@end

@implementation EditDrugsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Add Medication";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"save", nil) style:UIBarButtonItemStyleDone target:self action:@selector(saveMedication:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"cancel", nil) style:UIBarButtonItemStylePlain target:self action:@selector(cancelEditMedication:)];
}

- (void)saveMedication:(UIBarButtonItem*)barButtonItem {
    //todo stoecklim: persist medication object
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cancelEditMedication:(UIBarButtonItem*)barButtonItem {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EditDrugsTableViewCell *cell = (EditDrugsTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"EditDrugsTableViewCell" forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            cell.inputTitle.text = @"Name of drug";
            cell.inputValue.placeholder = @"Enter name of drug";
            break;
        case 1:
            cell.inputTitle.text = @"Form";
            cell.inputValue.placeholder = @"Enter form";
            break;
        case 2:
            cell.inputTitle.text = @"Package size / Quantity";
            cell.inputValue.placeholder = @"Enter package size";
            break;
        case 3:
            cell.inputTitle.text = @"Frequency";
            cell.inputValue.placeholder = @"Enter frequency";
            break;
        case 4:
            cell.inputTitle.text = @"Duration";
            cell.inputValue.placeholder = @"Enter duration";
            break;
        case 5:
            cell.inputTitle.text = @"Start date";
            cell.inputValue.placeholder = @"Enter start date";
            break;
        case 6:
            cell.inputTitle.text = @"Time";
            cell.inputValue.placeholder = @"Enter intake time";
            break;
        case 7:
            cell.inputTitle.text = @"Notes";
            cell.inputValue.placeholder = @"Enter notes";
            break;
        default:
            cell.inputTitle.text = @"NOT IMPLEMENTED";
            cell.inputValue.placeholder = @"NOT IMPLEMENTED";
            break;
    }
    
    cell.inputTitle.textColor = [UIColor hackathonTabBarColor];
    cell.inputValue.textColor = [UIColor hackathonAccentColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
