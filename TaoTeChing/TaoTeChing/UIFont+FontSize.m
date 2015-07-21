//
//  UIFont+FontSize.m
//  TaoTeChing
//
//  Created by John Bogil on 7/21/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import "UIFont+FontSize.h"
#import "SettingsManager.h"
@implementation UIFont (FontSize)

+ (NSInteger)fontSize{
    
    if ([SettingsManager sharedManager].fontSize == 0) {
        NSLog(@"Returning 18 for font size");
        return 18;
    } else if([SettingsManager sharedManager].fontSize == 1) {
        NSLog(@"Returning 22 for font size");
        return 22;
    }else{
        NSLog(@"Returning 26 for font size");
        return 26;
    }
}

@end
