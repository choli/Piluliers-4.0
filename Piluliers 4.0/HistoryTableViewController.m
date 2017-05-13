//
//  HistoryTableViewController.m
//  Piluliers 4.0
//
//  Created by Stoeckli Michael, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "HistoryTableViewController.h"
#import "TimelineTableViewCell.h"
#import "HistoryGraphView.h"
#import "UIColor+CustomColors.h"
#import "RestManager.h"
#import "MedicationManager.h"
#import "MedicationData.h"

@interface HistoryTableViewController ()

@property (nonatomic, weak) RestManager *restManager;
@property (nonatomic, strong) NSDictionary *data;

@end

@implementation HistoryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"history", nil);
    
    HistoryGraphView *historyGraphView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([HistoryGraphView class]) owner:self options:nil] firstObject];
    [historyGraphView setBackgroundColor:[UIColor hackathonAccentColor]];

    [self.navigationController.view addSubview:historyGraphView];
    historyGraphView.translatesAutoresizingMaskIntoConstraints = NO;
    [historyGraphView.heightAnchor constraintEqualToConstant:150].active = YES;
    [historyGraphView.topAnchor constraintEqualToAnchor:self.navigationController.view.topAnchor constant:[self getNavBarHeight]].active = YES;
    [historyGraphView.leftAnchor constraintEqualToAnchor:self.navigationController.view.leftAnchor].active = YES;
    [historyGraphView.rightAnchor constraintEqualToAnchor:self.navigationController.view.rightAnchor].active = YES;
    
    self.restManager = [RestManager sharedInstance];
    [self.tableView setScrollIndicatorInsets:UIEdgeInsetsMake(150, 0, 0, 0)];
    [self.tableView setContentInset:UIEdgeInsetsMake(150, 0, 0, 0)];
    
    [historyGraphView populateData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadData];
    [self.tableView reloadData];
}

- (void)loadData {
    NSString * userId;
    if ([[NSUserDefaults standardUserDefaults]
         stringForKey:@"userId"]!=nil){
        userId =[[NSUserDefaults standardUserDefaults]
                 stringForKey:@"userId"];
    }
    else{
        userId = @".PAT_10";
    }

    MedicationManager *medicationManager = [MedicationManager new];
    [medicationManager getDailyMedicationsForPatient:@".PAT_10" withCompletionBlock:^(NSDictionary *medications, NSError *error) {
        NSLog(@"Medications: %@", medications);
        self.data = medications;
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)getNavBarHeight {
    CGFloat navigationBarHeight = self.navigationController.navigationBar.frame.size.height;
    CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    return navigationBarHeight + statusBarHeight;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"12.05.2017";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TimelineTableViewCell *cell = (TimelineTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TimelineTableViewCell" forIndexPath:indexPath];
    NSArray *allSections = [self.data allValues];
    MedicationData *medicationData = [[allSections objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.intakeTime.text = [MedicationManager timeStringForTiming:@(indexPath.section)];
    cell.pillImage.image = [UIImage imageNamed:[medicationData formImageName]];
    [UIColor colorIconImageView:cell.pillImage color:[UIColor hackathonAccentColor]];
    cell.medicamentName.text = medicationData.title;
    cell.medicamentDescription.text = medicationData.notes;
    cell.medicamentDosage.text = [NSString stringWithFormat:@"1 %@", medicationData.form];
    
    if (medicationData.intakeStatus) {
        cell.intakeIndicator.hidden = NO;
        switch ([medicationData.intakeStatus intValue]) {
            case 0:
                cell.intakeIndicator.text = @"Taken";
                cell.intakeIndicator.backgroundColor = [UIColor cellSwipeTakeColor];
                break;
            case 1:
                cell.intakeIndicator.text = @"Skipped";
                cell.intakeIndicator.backgroundColor = [UIColor cellSwipeSkipColor];
                break;
            case 2:
                cell.intakeIndicator.text = @"Ignored";
                cell.intakeIndicator.backgroundColor = [UIColor cellSwipeIgnoreColor];
                break;
            default:
                break;
        }
        
        cell.intakeIndicator.layer.cornerRadius = 5.0f;
        cell.intakeIndicator.layer.masksToBounds = YES;
        cell.intakeIndicator.textColor = [UIColor blackColor];
    } else {
        cell.intakeIndicator.hidden = YES;
    }
    
    cell.userInteractionEnabled = NO;
    return cell;
}

@end
