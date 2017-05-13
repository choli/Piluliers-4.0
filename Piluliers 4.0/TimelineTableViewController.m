//
//  TimelineTableViewController.m
//  Piluliers 4.0
//
//  Created by Stoeckli Michael, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "TimelineTableViewController.h"
#import "TimelineDetailTableViewController.h"
#import "TimelineTableViewCell.h"
#import "UIColor+CustomColors.h"
#import "TimelineHeaderView.h"
#import "EditDrugsTableViewController.h"
#import "RestManager.h"
#import "MedicationManager.h"

@interface TimelineTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) RestManager *restManager;
@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, weak) TimelineHeaderView *timelineHeaderView;

@end

@implementation TimelineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"timeline", nil);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"addpill"] style:UIBarButtonItemStylePlain target:self action:@selector(addMedication:)];
    [self addTableViewHeaderView];
    self.restManager = [RestManager sharedInstance];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadData];
}

- (void)loadData {
    //todo stoecklim
    [self.restManager getPatient:@".PAT_10" withCompletionBlock:^(PatientData *patient, NSError *error) {
        self.timelineHeaderView.usernameLabel.text = [NSString stringWithFormat:@"%@ %@", @"Hallo", patient.given];
        self.timelineHeaderView.userImageView.image = patient.photo;
    }];
    
    MedicationManager *medicationManager = [MedicationManager new];
    [medicationManager getDailyMedicationsForPatient:@".PAT_10" withCompletionBlock:^(NSDictionary *medications, NSError *error) {
        NSLog(@"Medications: %@", medications);
        self.data = medications;
        [self.tableView reloadData];
    }];
}

- (void)addTableViewHeaderView {
    self.timelineHeaderView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([TimelineHeaderView class]) owner:self options:nil] firstObject];
    //todo stoecklim: add username and image from model
    self.timelineHeaderView.backgroundColor = [UIColor hackathonAccentColor];
    self.timelineHeaderView.datePicker.backgroundColor = [UIColor whiteColor];
    [self.timelineHeaderView.datePicker addTarget:self action:@selector(dateChanged:)
     forControlEvents:UIControlEventValueChanged];
    self.tableView.tableHeaderView = self.timelineHeaderView;
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

- (void)dateChanged:(UIDatePicker*)datePicker {
    //todo stoecklim: handle date change
    [self.tableView reloadData];
}

# pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.data.allKeys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *allSections = [self.data allValues];
    return [[allSections objectAtIndex:section] count];
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TimelineTableViewCell *cell = (TimelineTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TimelineTableViewCell" forIndexPath:indexPath];
    //todo stoecklim: set data from model
    NSArray *allSections = [self.data allValues];
    MedicationData *medicationData = [[allSections objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.intakeTime.text = @"12:00";
    cell.pillImage.image = [UIImage imageNamed:@"crystal"]; //todo stoecklim: show appropriate image
    [UIColor colorIconImageView:cell.pillImage color:[UIColor hackathonAccentColor]];
    cell.medicamentName.text = medicationData.title;
    cell.medicamentDescription.text = medicationData;
    cell.medicamentDosage.text = @"1 Kapsel";
    cell.intakeIndicator.text = @"Taken";
    cell.intakeIndicator.backgroundColor = [UIColor cellSwipeTakeColor];
    cell.intakeIndicator.layer.cornerRadius = 5.0f;
    cell.intakeIndicator.layer.masksToBounds = YES;
    cell.intakeIndicator.textColor = [UIColor blackColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

# pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TimelineDetailTableViewController *timelineTableDetailViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"TimelineDetailTableViewController"];
//    timelineTableDetailViewController.titleString = @"Medikament X"; //todo stoecklim: pass model instead of string
    [self.navigationController pushViewController:timelineTableDetailViewController animated:YES];
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *takeAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:NSLocalizedString(@"take", nil) handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        //todo stoecklim: mark as taken and persist
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }];
    
    takeAction.backgroundColor = [UIColor cellSwipeTakeColor];

    UITableViewRowAction *skipAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:NSLocalizedString(@"skip", nil) handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        //todo stoecklim: mark as skipped and persist
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }];
    
    skipAction.backgroundColor = [UIColor cellSwipeSkipColor];

    UITableViewRowAction *ignoreAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:NSLocalizedString(@"ignore", nil) handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        //todo stoecklim: mark as ignored and persist
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }];
    
    ignoreAction.backgroundColor = [UIColor cellSwipeIgnoreColor];

    return @[takeAction, skipAction, ignoreAction];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
}

@end
