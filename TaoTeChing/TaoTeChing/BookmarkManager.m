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
        self.bookmarks = [self.defaults objectForKey:@"bookmarks"];
        if(!self.bookmarks){
                self.bookmarks = [[NSMutableDictionary alloc]init];
        }
    }
    return self;
}

- (void)addBookmark:(NSString*)chapterNumber{

    //[self.defaults setInteger:chapterNumber forKey:[NSString stringWithFormat:@"%d", chapterNumber]];
    [self.bookmarks setObject:chapterNumber forKey:chapterNumber];
    [self.defaults setObject:self.bookmarks forKey:@"bookmarks"];
}

- (void)removeBookmark:(int)chapterNumber{
    
    [self.defaults removeObjectForKey:[NSString stringWithFormat:@"%d", chapterNumber]];
    [self.defaults synchronize];
}
@end
