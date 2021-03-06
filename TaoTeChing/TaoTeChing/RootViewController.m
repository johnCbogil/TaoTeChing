//
//  RootViewController.m
//  TaoTeChing
//
//  Created by John Bogil on 6/15/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import "RootViewController.h"
#import "ModelController.h"
#import "DataViewController.h"
#import "PageViewController.h"
#import "FavoritesManager.h"
#import "UIColor+NightMode.h"
#import "SettingsManager.h"

@implementation RootViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    [PageViewController pageViewController].pageViewController.delegate = self;
    
    DataViewController *startingViewController = [[ModelController modelController] viewControllerAtIndex:[SettingsManager sharedManager].lastChapter storyboard:self.storyboard];
    NSArray *viewControllers = @[startingViewController];
    [[PageViewController pageViewController].pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [PageViewController pageViewController].pageViewController.dataSource = [ModelController modelController];
    
    [self addChildViewController:[PageViewController pageViewController].pageViewController];
    [self.containerView addSubview:[PageViewController pageViewController].pageViewController.view];
    
    
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:[PageViewController pageViewController].pageViewController.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:[PageViewController pageViewController].pageViewController.view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:[PageViewController pageViewController].pageViewController.view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:[PageViewController pageViewController].pageViewController.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    [[PageViewController pageViewController].pageViewController.view setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.containerView addConstraints:@[bottom, top, left, right]];
    
    // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
    CGRect pageViewRect = self.view.bounds;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        pageViewRect = CGRectInset(pageViewRect, 40.0, 40.0);
    }
    [PageViewController pageViewController].pageViewController.view.frame = pageViewRect;
    
    [[PageViewController pageViewController].pageViewController didMoveToParentViewController:self];
    
    // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
    self.view.gestureRecognizers = [PageViewController pageViewController].pageViewController.gestureRecognizers;
}

- (void)viewWillAppear:(BOOL)animated {
    self.view.backgroundColor = [UIColor viewBackgroundColor];
    self.tabBarController.tabBar.barTintColor = [UIColor viewBackgroundColor];
    [UINavigationBar appearance].barTintColor = [UIColor viewBackgroundColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)indexButtonPressed:(id)sender {
    
    NSLog(@"indexButtonPressed");
}
- (IBAction)favoriteButtonPressed:(id)sender {
    DataViewController *currentView = [[PageViewController pageViewController].pageViewController.viewControllers objectAtIndex:0];
    NSInteger currentIndex = [[ModelController modelController] indexOfViewController:currentView];
    
    if (self.favoriteButton.isSelected) {
        NSLog(@"Removing page: %ld", (long)currentIndex);
        [[FavoritesManager favoritesManager]removeFavorite:currentIndex
                                              onCompletion:^{
                                              }];
    }
    else {
        NSLog(@"Favoriting page: %ld",(long)currentIndex);
        [[FavoritesManager favoritesManager]addFavorite:[NSString stringWithFormat:@"%ld",currentIndex]];
    }
    [self favoriteButtonTouch:sender withEvent:nil];
}

- (void)favoriteButtonTouch:(UIButton *)aButton withEvent:(UIEvent *)event {
    
    //aButton.selected = YES;
    self.favoriteButton.selected = !self.favoriteButton.selected;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
    DataViewController *currentView = [pageViewController.viewControllers objectAtIndex:0];
    NSInteger currentIndex = [[ModelController modelController] indexOfViewController:currentView];
    NSLog(@"The current chapter is: %ld", (long)currentIndex);
}
@end