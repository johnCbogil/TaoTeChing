//
//  FavoritesManager.m
//  TaoTeChing
//
//  Created by John Bogil on 6/27/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import "FavoritesManager.h"

@implementation FavoritesManager

static FavoritesManager *sharedInstance = nil;

// update singleton code, use dispatch once. may not need multiple class methods
+ (FavoritesManager *)instantiateFavoritesManager
{
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[FavoritesManager alloc] init];
        }
        return sharedInstance;
    }
}
+ (FavoritesManager *)favoritesManager
{
    if (sharedInstance==nil)
    {
        [FavoritesManager instantiateFavoritesManager];
    }
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.defaults = [NSUserDefaults standardUserDefaults];
        self.favorites = [[self.defaults objectForKey:@"favorites"]mutableCopy];
        if(!self.favorites){
            self.favorites = [[NSMutableArray alloc]init];
        }
    }
    return self;
}

- (void)addFavorite:(NSString*)chapterNumber{
    
    //[self.defaults setInteger:chapterNumber forKey:[NSString stringWithFormat:@"%d", chapterNumber]];
    [self.favorites addObject:chapterNumber];
    [self.defaults setObject:self.favorites forKey:@"favorites"];
}

- (void)removeFavorite:(NSInteger)chapterNumber onCompletion:(void(^)(void))completionBlock{
    
    NSString *favoriteToRemove = nil;
    for (NSString *favorites in self.favorites) {
        if ([favorites isEqualToString:[NSString stringWithFormat:@"%ld",(long)chapterNumber]]) {
            favoriteToRemove = favorites;
        }
    }
    if (favoriteToRemove) {
        [self.favorites removeObject:favoriteToRemove];
    }
    [self.defaults setObject:self.favorites forKey:@"favorites"];
    if (completionBlock) {
        completionBlock();
    }
}
@end