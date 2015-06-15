//
//  DataViewController.m
//  TaoTeChing
//
//  Created by John Bogil on 6/15/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import "DataViewController.h"

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
}

- (IBAction)homeButtonPressed:(id)sender {
}
@end
