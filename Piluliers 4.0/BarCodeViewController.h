//
//  BarCodeViewController.h
//  Piluliers 4.0
//
//  Created by Projet REACH on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BarCodeViewController : UIViewController


- (IBAction)scanAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *loginUITextField;

@end
