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

        self.listOfBookmarks = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)addBookmark:(int)chapterNumber{
    
    NSNumber *chapterNumberFormatted = [NSNumber numberWithInt:chapterNumber];
    [self.listOfBookmarks addObject:chapterNumberFormatted];
}

- (void)logBookmarks{
    NSLog(@"%@", self.listOfBookmarks);
}

@end
