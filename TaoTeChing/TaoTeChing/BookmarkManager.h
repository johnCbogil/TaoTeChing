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
- (void)addBookmark:(NSString*)chapterNumber;
- (void)removeBookmark:(NSString*)chapterNumber;
+ (BookmarkManager *)bookmarkManager;
+ (BookmarkManager *)instantiateBookmarkManager;
@property (nonatomic)NSMutableArray *bookmarks;
@end
