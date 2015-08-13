//
//  TabBarViewController.m
//  TaoTeChing
//
//  Created by John Bogil on 6/22/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.selectedIndex = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Decrease size of tabbar
//- (void)viewWillLayoutSubviews {
//    CGRect tabFrame = self.tabBar.frame;
//    tabFrame.size.height = 44;
//    tabFrame.origin.y = self.view.frame.size.height - 44;
//    self.tabBar.frame = tabFrame;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
