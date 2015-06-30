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

-(void)logBookmarks;

- (void)addBookmark:(int)chapterNumber;
+ (BookmarkManager *)bookmarkManager;
+ (BookmarkManager *)instantiateBookmarkManager;
@end
