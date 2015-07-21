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
        return 18;
    } else if([SettingsManager sharedManager].fontSize == 1) {
        return 22;
    }else{
        return 26;
    }
}

@end
