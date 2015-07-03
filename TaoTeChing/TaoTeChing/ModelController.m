//
//  ModelController.m
//  TaoTeChing
//
//  Created by John Bogil on 6/15/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import "ModelController.h"
#import "DataViewController.h"

@implementation ModelController

static ModelController *sharedInstance = nil;

+ (ModelController *)instantiateModelController
{
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[ModelController alloc] init];
        }
        return sharedInstance;
    }
}
+ (ModelController *)modelController
{
    if (sharedInstance==nil)
    {
        [ModelController instantiateModelController];
    }
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {

        NSString *path = [[NSBundle mainBundle] pathForResource:@"TaoTeChing - Gia"
                                                         ofType:@"txt"];
        NSString *content = [NSString stringWithContentsOfFile:path
                                                      encoding:NSUTF8StringEncoding
                                                         error:NULL];
        NSArray *lines = [content componentsSeparatedByString:@"#"];
        
        //change lines to "text"
        _pageData = lines;        
    }
    return self;
}

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard {
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }

    // Create a new view controller and pass suitable data.
    self.dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"DataViewController"];
    self.dataViewController.dataObject = self.pageData[index];
    // consider moving current chapter to vc
    self.dataViewController.currentChapter = (int)index;

    
    return self.dataViewController;
}



- (NSUInteger)indexOfViewController:(DataViewController *)viewController {
    // Return the index of the given data view controller.
    // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:viewController.dataObject];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}


@end
