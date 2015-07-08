//
//  DataViewController.h
//  TaoTeChing
//
//  Created by John Bogil on 6/15/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController
@property (strong, nonatomic) id dataObject;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

