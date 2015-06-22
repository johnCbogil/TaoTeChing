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

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.textView scrollRangeToVisible:NSMakeRange(0, 1)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.dataLabel.text = [self.dataObject description];
    self.textView.font = [UIFont fontWithName:@"Avenir Next" size:18];
    self.textView.text = [self.dataObject description];
    
    NSLog(@"%@ frame in viewWillAppear: %p", NSStringFromCGRect(self.textView.frame), self.dataObject);
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"%@ frame in layoutSub: %p", NSStringFromCGRect(self.textView.frame), self.dataObject);

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@" ");
    NSLog(@"%@ frame in viewDidAppear: %p", NSStringFromCGRect(self.textView.frame), self.dataObject);
}

- (IBAction)homeButtonPressed:(id)sender {

    DataViewController *zeroVC = [[ModelController modelController] viewControllerAtIndex:0 storyboard:self.storyboard];
    NSArray *viewControllers = @[zeroVC];
    
    
    // Forward/Reverse depends on index number
    [[PageViewController pageViewController].pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
}
@end
