//
//  ModelController.h
//  TaoTeChing
//
//  Created by John Bogil on 6/15/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@property (readonly, strong, nonatomic) NSArray *pageData;
@property (nonatomic, weak) DataViewController *dataViewController;

+(ModelController *)modelController;
+(ModelController *)instantiateModelController;

@end

