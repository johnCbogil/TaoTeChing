//
//  BookmarkManager.m
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
        self.bookmarks = [[self.defaults objectForKey:@"bookmarks"]mutableCopy];
        if(!self.bookmarks){
            self.bookmarks = [[NSMutableArray alloc]init];
        }
    }
    return self;
}

- (void)addBookmark:(NSString*)chapterNumber{
    
    //[self.defaults setInteger:chapterNumber forKey:[NSString stringWithFormat:@"%d", chapterNumber]];
    [self.bookmarks addObject:chapterNumber];
    [self.defaults setObject:self.bookmarks forKey:@"bookmarks"];
}

- (void)removeBookmark:(NSInteger)chapterNumber onCompletion:(void(^)(void))completionBlock{
    
    NSString *bookmarkToRemove = nil;
    for (NSString *bookmark in self.bookmarks) {
        if ([bookmark isEqualToString:[NSString stringWithFormat:@"%ld",(long)chapterNumber]]) {
            bookmarkToRemove = bookmark;
        }
    }
    if (bookmarkToRemove) {
        [self.bookmarks removeObject:bookmarkToRemove];
    }
    [self.defaults setObject:self.bookmarks forKey:@"bookmarks"];
    if (completionBlock) {
        completionBlock();
    }
}
@end
