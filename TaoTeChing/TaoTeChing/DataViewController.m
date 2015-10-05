//
//  DataViewController.m
//  TaoTeChing
//
//  Created by John Bogil on 6/15/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import "DataViewController.h"
#import "PageViewController.h"
#import "ModelController.h"
#import "FavoritesManager.h"
#import "RootViewController.h"
#import "SettingsManager.h"
#import "UIColor+NightMode.h"
#import "UIFont+FontSize.h"
#import "SettingsManager.h"


@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.textView scrollRangeToVisible:NSMakeRange(0, 1)];
    
    // Hide navigationBar shadow
    //    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    // Print all of nsuserdefaults
    //    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.textView.font = [UIFont fontWithName:@"Avenir Next" size:[UIFont fontSize]];
    self.textView.text = [self.dataObject description];
    self.textView.textColor = [UIColor textColor];

}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    DataViewController *currentView = [[PageViewController pageViewController].pageViewController.viewControllers objectAtIndex:0];
    NSInteger currentIndex = [[ModelController modelController] indexOfViewController:currentView];
    [[SettingsManager sharedManager]updateLastChapter:currentIndex];
    RootViewController *rvc = (RootViewController*)[PageViewController pageViewController].pageViewController.delegate;
    
    if ([[FavoritesManager favoritesManager].favorites containsObject:[NSString stringWithFormat:@"%ld", (long)currentIndex]]) {
        NSLog(@"This page has been bookmarked");
        [rvc.bookmarkButton setSelected:YES];
    }
    else{
        NSLog(@"This page has NOT been bookmarked");
        [rvc.bookmarkButton setSelected:NO];
    }
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterSpellOutStyle];
    
    CATransition *transition = [CATransition animation];
    [transition setType:kCATransitionFade];
    [transition setDuration:.25f];
    [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [rvc.chapterLabel.layer addAnimation:transition forKey:@"highlight"];
    
    
    if (currentIndex == 0) {
        rvc.chapterLabel.text = @"About";
    }
    else{
        rvc.chapterLabel.text = [NSString stringWithFormat:@"Chapter %@",[numberFormatter stringFromNumber:[NSNumber numberWithInt:(int)currentIndex]].capitalizedString];
    }
}
@end