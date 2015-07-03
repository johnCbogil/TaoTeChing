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
        // retreive bookmarks here
    }
    return self;
}

- (void)addBookmark:(int)chapterNumber forKey:(int)chapterNumberString{

    [self.defaults setInteger:chapterNumber forKey:[NSString stringWithFormat:@"%d", chapterNumber]];
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);

}
@end
