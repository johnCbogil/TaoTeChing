//
//  JumpToPageTableViewCell.h
//  TaoTeChing
//
//  Created by John Bogil on 8/11/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JumpToPageTableViewCellDelegate <NSObject>

- (void)jumpToChapter:(NSInteger)chapter;

@end

@interface JumpToPageTableViewCell : UITableViewCell
@property (weak, nonatomic) id <JumpToPageTableViewCellDelegate> cellDelegate;
@end
