//
//  TimelineTableViewCell.h
//  Piluliers 4.0
//
//  Created by Stoeckli Michael, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimelineTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *intakeTime;
@property (weak, nonatomic) IBOutlet UIImageView *pillImage;
@property (weak, nonatomic) IBOutlet UILabel *medicamentName;
@property (weak, nonatomic) IBOutlet UILabel *medicamentDescription;
@property (weak, nonatomic) IBOutlet UILabel *medicamentDosage;
@property (weak, nonatomic) IBOutlet UILabel *intakeIndicator;

@end
