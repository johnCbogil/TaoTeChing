//
//  FavoritesManager.h
//  TaoTeChing
//
//  Created by John Bogil on 6/27/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FavoritesManager : NSObject

@property (nonatomic) NSUserDefaults *defaults;
- (void)addFavorite:(NSString*)chapterNumber;
- (void)removeFavorite:(NSInteger)chapterNumber onCompletion:(void(^)(void))completionBlock;
+ (FavoritesManager *)favoritesManager;
+ (FavoritesManager *)instantiateFavoritesManager;
@property (nonatomic)NSMutableArray *favorites;
@end
