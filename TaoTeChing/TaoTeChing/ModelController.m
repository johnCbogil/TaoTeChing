//
//  ModelController.m
//  TaoTeChing
//
//  Created by John Bogil on 6/15/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import "ModelController.h"
#import "DataViewController.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */
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
    self.dataViewController.currentChapter = (int)index;

    
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle: NSNumberFormatterSpellOutStyle];
    NSString* numberString = [formatter stringFromNumber:self.pageData[index]];
    
    if (self.dataViewController.currentChapterString == 0) {
        self.dataViewController.currentChapterString = @"About";
    }
    else{
        self.dataViewController.currentChapterString = numberString.capitalizedString;
    }
    
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
