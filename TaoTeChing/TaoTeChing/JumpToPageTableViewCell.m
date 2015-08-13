//
//  JumpToPageTableViewCell.m
//  TaoTeChing
//
//  Created by John Bogil on 8/11/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import "JumpToPageTableViewCell.h"
#import "DataViewController.h"
#import "PageViewController.h"
#import "ModelController.h"

@interface JumpToPageTableViewCell()
@property (weak, nonatomic) IBOutlet UIButton *goButton;
@property (weak, nonatomic) IBOutlet UITextField *jumpToPageTextField;

@end

@implementation JumpToPageTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)goButtonPressed:(id)sender {

    if ([self.cellDelegate respondsToSelector:@selector(jumpToChapter:)]) {
        [self.cellDelegate jumpToChapter:[self.jumpToPageTextField.text integerValue]];
    }
    
}

@end
