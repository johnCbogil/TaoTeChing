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

+ (UIColor *)textViewBackgroundColor{

    if ([SettingsManager sharedManager].isNightModeOn) {
        return [UIColor redColor];
    } else {
        return [UIColor clearColor];
    }
}

@end
