//
//  BookmarkManager.m
//  TaoTeChing
//
//  Created by John Bogil on 6/27/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import "BookmarkManager.h"

@implementation BookmarkManager

static BookmarkManager *sharedInstance = nil;

// update singleton code, use dispatch once. may not need multiple class methods
+ (BookmarkManager *)instantiateBookmarkManager
{
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[BookmarkManager alloc] init];
        }
        return sharedInstance;
    }
}
+ (BookmarkManager *)bookmarkManager
{
    if (sharedInstance==nil)
    {
        [BookmarkManager instantiateBookmarkManager];
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
    
    
//    [self.defaults removeObjectForKey:[NSString stringWithFormat:@"%d", chapterNumber]];
//    [self.bookmarks removeObjectAtIndex:chapterNumber]; //:chapterNumber];
    NSString *bookmarkToRemove = nil;
    for (NSString *bookmark in self.bookmarks) {
        if ([bookmark isEqualToString:[NSString stringWithFormat:@"%ld",chapterNumber]]) {
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
