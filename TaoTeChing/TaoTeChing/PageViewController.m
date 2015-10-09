//
//  PageViewController.m
//  TaoTeChing
//
//  Created by John Bogil on 6/20/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import "PageViewController.h"

@implementation PageViewController

static PageViewController *sharedInstance = nil;

+ (PageViewController *)instantiatePageViewController
{
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[PageViewController alloc] init];
        }
        return sharedInstance;
    }
}
+ (PageViewController *)pageViewController
{
    if (sharedInstance==nil)
    {
        [PageViewController instantiatePageViewController];
    }
    return sharedInstance;
}
- (id) init
{
    self = [super init];
    if(self)
    {
        self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    }
    return self;
}
@end