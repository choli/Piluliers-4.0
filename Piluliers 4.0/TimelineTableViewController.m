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

@interface TimelineTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) RestManager *restManager;
@property (nonatomic, weak) NSArray<NSObject*>* data;
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
    [self.tableView reloadData];
}

- (void)loadData {
    //todo stoecklim
    [self.restManager getPatient:@".PAT_10" withCompletionBlock:^(PatientData *patient, NSError *error) {
//        NSLog(@"Patient: %@", patient);
//        NSLog(@"Patient-Name: %@", patient.family);
//        NSLog(@"Patient-Vorname: %@", patient.given);
//        NSLog(@"Patient-Image: %@", patient.photo);
        self.timelineHeaderView.usernameLabel.text = [NSString stringWithFormat:@"%@ %@", @"Hallo", patient.given];
        self.timelineHeaderView.userImageView.image = patient.photo;
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
    return 4; //todo stoecklim: make dynamic
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2; //todo stoecklim: make dynamic
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
    cell.intakeTime.text = @"12:00";
    cell.pillImage.image = [UIImage imageNamed:@"crystal"]; //todo stoecklim: show appropriate image
    [UIColor colorIconImageView:cell.pillImage color:[UIColor hackathonAccentColor]];
    cell.medicamentName.text = @"Medikament X";
    cell.medicamentDescription.text = @"Dies ist eine Pille";
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
