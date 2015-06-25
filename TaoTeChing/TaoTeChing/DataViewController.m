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
    [self formatChapterLabel];

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
//    self.dataLabel.text = [self.dataObject description];
    self.textView.font = [UIFont fontWithName:@"Avenir Next" size:18];
    self.textView.text = [self.dataObject description];

    NSLog(@"%@ frame in viewWillAppear: %p", NSStringFromCGRect(self.navigationBar.frame), self.dataObject);
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"%@ frame in layoutSub: %p", NSStringFromCGRect(self.navigationBar.frame), self.dataObject);

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@" ");
    NSLog(@"%@ frame in viewDidAppear: %p", NSStringFromCGRect(self.navigationBar.frame), self.dataObject);
}

- (IBAction)homeButtonPressed:(id)sender {

    DataViewController *zeroVC = [[ModelController modelController] viewControllerAtIndex:0 storyboard:self.storyboard];
    NSArray *viewControllers = @[zeroVC];
    
    
    // Page direction depends on index number
    [[PageViewController pageViewController].pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
}

- (void)formatChapterLabel{

    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle: NSNumberFormatterSpellOutStyle];
    NSString* numberString = [formatter stringFromNumber:[NSNumber numberWithInt: self.currentChapter]];
    
    if (self.currentChapter == 0) {
        self.chapterLabel.text = @"About";
    }
    else{
        self.chapterLabel.text = numberString.capitalizedString;
    }
    self.chapterLabel.font = [UIFont fontWithName:@"Avenir Next" size:20];
}
@end
