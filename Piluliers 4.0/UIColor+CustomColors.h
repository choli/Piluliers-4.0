//
//  UIColor+CustomColors.h
//  Piluliers 4.0
//
//  Created by Stoeckli Michael, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CustomColors)

+ (UIColor*)hackathonTintColor;
+ (UIColor*)hackathonAccentColor;
+ (UIColor*)colorPostDarkBlue;
+ (UIColor*)cellSwipeTakeColor;
+ (UIColor*)cellSwipeSkipColor;
+ (UIColor*)cellSwipeIgnoreColor;

+ (void)colorIconImageView:(UIImageView*)imageView color:(UIColor*)color;
+ (UIColor*)colorWithHexString:(NSString*)hexString;
- (NSString *)hexString;

@end

#define UIColorFromHEXWithAlpha(hexValue,a) [UIColor \
colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((hexValue & 0xFF00) >> 8))/255.0 \
blue:((float)(hexValue & 0xFF))/255.0 alpha:a]

#define UIColorFromHEX(hexValue) UIColorFromHEXWithAlpha(hexValue, 1)
