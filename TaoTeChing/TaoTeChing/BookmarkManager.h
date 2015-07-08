//
//  BookmarkManager.h
//  TaoTeChing
//
//  Created by John Bogil on 6/27/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookmarkManager : NSObject

@property (nonatomic) NSUserDefaults *defaults;
- (void)addBookmark:(int)chapterNumber forKey:(int)chapterNumberString;
- (void)removeBookmark:(int)chapterNumber;
+ (BookmarkManager *)bookmarkManager;
+ (BookmarkManager *)instantiateBookmarkManager;
@end
