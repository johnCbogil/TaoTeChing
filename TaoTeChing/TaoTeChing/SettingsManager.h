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
- (void)updateFontSize:(NSInteger)fontSize;
@property (assign, nonatomic) BOOL isNightModeOn;
@property (nonatomic) NSInteger fontSize;



@end
