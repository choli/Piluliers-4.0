//
//  EditDrugsTableViewCell.h
//  Piluliers 4.0
//
//  Created by Stoeckli Michael, IT133 on 13.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditDrugsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *inputValue;
@property (weak, nonatomic) IBOutlet UILabel *inputTitle;

@end
