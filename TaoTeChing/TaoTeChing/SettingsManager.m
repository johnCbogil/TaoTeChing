//
//  SettingsManager.m
//  TaoTeChing
//
//  Created by John Bogil on 7/14/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import "SettingsManager.h"

@interface SettingsManager()

@property (nonatomic, strong) NSUserDefaults *defaults;

@end

@implementation SettingsManager

+ (instancetype)sharedManager
{
    static SettingsManager *sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[SettingsManager alloc] init];
    });
    return sharedManager;
}

- (instancetype)init{
    
    self = [super init];
    if (self) {
        self.defaults = [NSUserDefaults standardUserDefaults];
        self.isNightModeOn = [self.defaults boolForKey:@"nightMode"];
    }
    return self;
}

- (void)updateNightMode:(BOOL)isNightModeOn{
    
    self.isNightModeOn = isNightModeOn;
    [self.defaults setBool:isNightModeOn forKey:@"nightMode"];

}

@end
