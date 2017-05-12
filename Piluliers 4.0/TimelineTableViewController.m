//
//  TimelineTableViewController.m
//  Piluliers 4.0
//
//  Created by Stoeckli Michael, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "TimelineTableViewController.h"
#import "TimelineTableViewCell.h"
#import "UIColor+CustomColors.h"
#import "TimelineHeaderView.h"

@interface TimelineTableViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation TimelineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"timeline", nil);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"pill"] style:UIBarButtonItemStylePlain target:self action:@selector(addMedication:)];
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self addTableViewHeaderView];
}

- (void)addTableViewHeaderView {
    TimelineHeaderView *timelineHeaderView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([TimelineHeaderView class]) owner:self options:nil] firstObject];
    //@meumannu: add username and image
    timelineHeaderView.usernameLabel.text = @"Hallo Sandro";
    timelineHeaderView.userImageView.image = [UIImage imageNamed:@"sandro"];
    timelineHeaderView.backgroundColor = [UIColor colorPostDarkBlue];
    timelineHeaderView.datePicker.backgroundColor = [UIColor whiteColor];
    [timelineHeaderView.datePicker addTarget:self action:@selector(dateChanged:)
     forControlEvents:UIControlEventValueChanged];
    self.tableView.tableHeaderView = timelineHeaderView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addMedication:(UIBarButtonItem*)barButtonItem {
    //todo present detail view controller
}

- (void)dateChanged:(UIDatePicker*)datePicker {
    // handle date changes
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TimelineTableViewCell *cell = (TimelineTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TimelineTableViewCell" forIndexPath:indexPath];
    //todo meumannu: set data from model
    cell.intakeTime.text = @"12:00";
    cell.pillImage.image = [UIImage imageNamed:@"pill"];
    cell.medicamentName.text = @"Medikament X";
    cell.medicamentDescription.text = @"Dies ist eine Pille";
    cell.medicamentDosage.text = @"1 Kapsel";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

# pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //todo stoecklim: present detail view controller
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *takeAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:NSLocalizedString(@"take", nil) handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        //todo stoecklim: mark as taken
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }];
    
    takeAction.backgroundColor = [UIColor cellSwipeTakeColor];

    UITableViewRowAction *skipAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:NSLocalizedString(@"skip", nil) handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        //todo stoecklim: mark as skipped
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }];
    
    skipAction.backgroundColor = [UIColor cellSwipeSkipColor];

    UITableViewRowAction *ignoreAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:NSLocalizedString(@"ignore", nil) handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        //todo stoecklim: mark as ignored
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }];
    
    ignoreAction.backgroundColor = [UIColor cellSwipeIgnoreColor];

    return @[takeAction, skipAction, ignoreAction];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
}

@end
