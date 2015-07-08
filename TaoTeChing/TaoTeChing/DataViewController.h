//
//  DataViewController.h
//  TaoTeChing
//
//  Created by John Bogil on 6/15/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@class RootViewController;

@interface DataViewController : UIViewController
@property (strong, nonatomic) id dataObject;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic) int currentChapter;

@property (nonatomic) RootViewController *rootVC;

@end

