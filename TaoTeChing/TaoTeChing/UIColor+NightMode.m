//
//  UIColor+NightMode.m
//  TaoTeChing
//
//  Created by John Bogil on 7/14/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import "UIColor+NightMode.h"
#import "SettingsManager.h"

@implementation UIColor (NightMode)

+ (UIColor *)viewBackgroundColor{

    if ([SettingsManager sharedManager].isNightModeOn) {
        return [UIColor blackColor];
    } else {
        return [UIColor whiteColor];
    }
}

+ (UIColor *)textColor{
    
    if ([SettingsManager sharedManager].isNightModeOn) {
        return [UIColor whiteColor];
    } else {
        return [UIColor blackColor];
    }
}

@end
