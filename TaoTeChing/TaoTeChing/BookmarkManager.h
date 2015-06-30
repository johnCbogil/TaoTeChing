//
//  BookmarkManager.h
//  TaoTeChing
//
//  Created by John Bogil on 6/27/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookmarkManager : NSObject

@property (nonatomic) NSMutableArray *listOfBookmarks;
@property (nonatomic) NSUserDefaults *defaults;
-(void)logBookmarks;

- (void)addBookmark:(int)chapterNumber forKey:(NSString*)chapterNumberString;
+ (BookmarkManager *)bookmarkManager;
+ (BookmarkManager *)instantiateBookmarkManager;
- (void)getBookmarkForKey:(NSString*)key;
@end
