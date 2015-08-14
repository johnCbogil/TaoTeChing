//
//  IndexHeader.h
//  TaoTeChing
//
//  Created by John Bogil on 8/11/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JumpToChapterDelegate <NSObject>
- (void)jumpToChapter:(NSInteger)chapter;
@end

@interface IndexHeader : UIView
@property (weak, nonatomic) id <JumpToChapterDelegate> jumpToChapterDelegate;
@property (weak, nonatomic) IBOutlet UITextField *jumpToPageTextField;
@end
