//
//  PageViewController.h
//  TaoTeChing
//
//  Created by John Bogil on 6/20/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PageViewController : NSObject

+ (PageViewController *)pageViewController;
+ (PageViewController *)instantiatePageViewController;

@property (strong, nonatomic) UIPageViewController *pageViewController;


@end
