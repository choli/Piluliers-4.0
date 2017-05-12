//
//  UIColor+CustomColors.m
//  Piluliers 4.0
//
//  Created by Stoeckli Michael, IT133 on 12.05.17.
//  Copyright © 2017 Post CH AG. All rights reserved.
//

#import "UIColor+CustomColors.h"

@implementation UIColor (CustomColors)

+ (UIColor*)colorPostYellow {
    return [UIColor colorWithHexString:@"#8bc34a"]; //#607d8b
}

+ (UIColor*)hackathonTintColor {
    return [UIColor colorWithHexString:@"#607d8b"];
}

-(NSString *)hexString {
    CGFloat redFloatValue, greenFloatValue, blueFloatValue, alphaFloatValue;
    int redIntValue, greenIntValue, blueIntValue, alphaIntValue;
    NSString *redHexValue, *greenHexValue, *blueHexValue, *alphaHexValue;
    
    BOOL componentSuccess = [self getRed:&redFloatValue green:&greenFloatValue blue:&blueFloatValue alpha:&alphaFloatValue];
    if(!componentSuccess)
    {
        return @"";
    }
    else
    {
        // Convert the components to numbers (unsigned decimal integer) between 0 and 255
        redIntValue=redFloatValue*255.99999f;
        greenIntValue=greenFloatValue*255.99999f;
        blueIntValue=blueFloatValue*255.99999f;
        alphaIntValue=alphaFloatValue*255.99999;
        
        // Convert the numbers to hex strings
        redHexValue=[NSString stringWithFormat:@"%02X", redIntValue];
        greenHexValue=[NSString stringWithFormat:@"%02X", greenIntValue];
        blueHexValue=[NSString stringWithFormat:@"%02X", blueIntValue];
        alphaHexValue=[NSString stringWithFormat:@"%02X", alphaIntValue];
        
        // Concatenate the red, green, and blue components' hex strings together with a "#"
        return [NSString stringWithFormat:@"#%@%@%@%@", redHexValue, greenHexValue, blueHexValue,alphaHexValue];
    }
    return nil;
}

+(UIColor*)colorWithHexString:(NSString*)hexString {
    UIColor* errorCol = [UIColor magentaColor];
    NSString* upperCaseHexString = [hexString uppercaseString];
    //check for valid string length
    if(hexString.length<6 || hexString.length>9)
    {
        return errorCol;
    }
    NSString *rHexString, *gHexString, *bHexString, *aHexString;
    uint rHexVal, gHexVal,bHexVal;
    uint aHexVal = 255;
    unichar startLetter = [hexString characterAtIndex:0];
    //if string starts with #, truncate it
    if(startLetter=='#')
    {
        upperCaseHexString = [upperCaseHexString substringFromIndex:1];
    }
    //check for valid string length
    if(!(upperCaseHexString.length==6 || upperCaseHexString.length==8))
    {
        return errorCol;
    }
    // check if characters are valid hex numbers
    NSString *hexRegex = @"[A-F0-9]*";
    NSPredicate *hexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", hexRegex];
    BOOL valid = [hexTest evaluateWithObject:upperCaseHexString];
    if(!valid)
    {
        return errorCol;
    }
    rHexString = [upperCaseHexString substringWithRange:NSMakeRange(0, 2)];
    gHexString = [upperCaseHexString substringWithRange:NSMakeRange(2,2)];
    bHexString = [upperCaseHexString substringWithRange:NSMakeRange(4,2)];
    NSScanner *scanner = [NSScanner scannerWithString:rHexString];
    [scanner scanHexInt:&rHexVal];
    scanner = [NSScanner scannerWithString:gHexString];
    [scanner scanHexInt:&gHexVal];
    scanner = [NSScanner scannerWithString:bHexString];
    [scanner scanHexInt:&bHexVal];
    if(upperCaseHexString.length==8)
    {
        aHexString = [upperCaseHexString substringWithRange:NSMakeRange(6,2)];
        scanner = [NSScanner scannerWithString:aHexString];
        [scanner scanHexInt:&aHexVal];
    }
    CGFloat mult = 1.0f/255;
    return [UIColor colorWithRed:rHexVal*mult green:gHexVal*mult blue:bHexVal*mult alpha:aHexVal*mult];
}

@end
