//
//  JumpToPageTableViewCell.m
//  TaoTeChing
//
//  Created by John Bogil on 8/11/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import "IndexHeader.h"
#import "DataViewController.h"
#import "PageViewController.h"
#import "ModelController.h"

@interface IndexHeader()
@property (weak, nonatomic) IBOutlet UIButton *goButton;
@end

@implementation IndexHeader

- (void)awakeFromNib {    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self addGestureRecognizer:tap];
}

- (void)dismissKeyboard {
    [self.jumpToPageTextField resignFirstResponder];
}

- (IBAction)goButtonPressed:(id)sender {

    if ([self.jumpToChapterDelegate respondsToSelector:@selector(jumpToChapter:)]) {
        [self.jumpToChapterDelegate jumpToChapter:[self.jumpToPageTextField.text integerValue]];
    }
    
}

@end
