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
#import "BookmarkManager.h"
#import "RootViewController.h"


@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.textView scrollRangeToVisible:NSMakeRange(0, 1)];

    // Hide navigationBar shadow
//    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.textView.font = [UIFont fontWithName:@"Avenir Next" size:18];
    self.textView.text = [self.dataObject description];
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
    RootViewController *rvc = (RootViewController*)[PageViewController pageViewController].pageViewController.delegate;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[[defaults dictionaryRepresentation]allKeys]containsObject:[NSString stringWithFormat:@"%ld", currentIndex]]) {
        NSLog(@"This page has been bookmarked");
        [rvc.bookmarkButton setSelected:YES];
    }
    else{
        NSLog(@"This page has NOT been bookmarked");
        [rvc.bookmarkButton setSelected:NO];
    }
}

// How to jump btw pages
- (IBAction)homeButtonPressed:(id)sender {

    DataViewController *zeroVC = [[ModelController modelController] viewControllerAtIndex:0 storyboard:self.storyboard];
    NSArray *viewControllers = @[zeroVC];
    
    
    // Page direction depends on index number
    [[PageViewController pageViewController].pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
}


@end
