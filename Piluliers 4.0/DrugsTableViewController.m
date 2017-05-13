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
#import "TimelineDetailTableViewController.h"
#import "EditDrugsTableViewController.h"
#import "RestManager.h"
#import "MedicationData.h"

@interface DrugsTableViewController ()

@property (nonatomic, weak) RestManager *restManager;
@property (nonatomic, weak) NSArray<MedicationData*> *data;
@property (nonatomic, weak) NSString *userData;

@end

@implementation DrugsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"drugs", nil);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"addpill"] style:UIBarButtonItemStylePlain target:self action:@selector(addMedication:)];
    self.restManager = [RestManager sharedInstance];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadData];
    [self.tableView reloadData];
}

- (void)loadData {
//    self.restManager getMedicationsForPatient:@".PAT" withCompletionBlock:<#^(NSArray *medications, NSError *error)completionBlock#>
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addMedication:(UIBarButtonItem*)barButtonItem {
    EditDrugsTableViewController *editDrugsTableViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"EditDrugsTableViewController"];
    UINavigationController *editDrugsNavigationController = [[UINavigationController alloc] initWithRootViewController:editDrugsTableViewController];
    editDrugsTableViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
    [self.tabBarController presentViewController:editDrugsNavigationController animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DrugsTableViewCell *cell = (DrugsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DrugsTableViewCell" forIndexPath:indexPath];
    MedicationData *medicationData = [self.data objectAtIndex:indexPath.row];
    cell.medicamentImage.image = [UIImage imageNamed:@"sandro"];
    cell.medicamentName.text = medicationData.title;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

# pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TimelineDetailTableViewController *timelineTableDetailViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"TimelineDetailTableViewController"];
    MedicationData *medicationData = [self.data objectAtIndex:indexPath.row];
    timelineTableDetailViewController.medicationData = medicationData;
    [self.navigationController pushViewController:timelineTableDetailViewController animated:YES];
}

@end
