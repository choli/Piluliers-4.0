//
//  EditDrugsTableViewController.m
//  Piluliers 4.0
//
//  Created by Stoeckli Michael, IT133 on 13.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "EditDrugsTableViewController.h"
#import "EditDrugsTableViewCell.h"

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
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EditDrugsTableViewCell *cell = (EditDrugsTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"EditDrugsTableViewCell" forIndexPath:indexPath];
    cell.inputTitle.text = @"TODO";
    cell.inputValue.placeholder = @"TODOOOOO";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
