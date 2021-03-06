//
//  RootViewController.h
//  TaoTeChing
//
//  Created by John Bogil on 6/15/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIPageViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITabBarItem *homeTabBarItem;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UIButton *indexButton;
@property (weak, nonatomic) IBOutlet UILabel *chapterLabel;
- (IBAction)indexButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *containerView;
- (IBAction)favoriteButtonPressed:(id)sender;
- (void)favoriteButtonTouch:(UIButton *)aButton withEvent:(UIEvent *)event;
@end

