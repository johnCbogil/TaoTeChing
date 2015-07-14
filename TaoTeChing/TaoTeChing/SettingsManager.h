//
//  SettingsManager.h
//  TaoTeChing
//
//  Created by John Bogil on 7/14/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingsManager : NSObject

+ (instancetype)sharedManager;
- (void)updateNightMode:(BOOL)isNightModeOn;


@end
