//
//  IndexTableViewController.h
//  TaoTeChing
//
//  Created by John Bogil on 7/14/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndexHeader.h"

@interface IndexTableViewController : UITableViewController
@property (strong ,nonatomic) IndexHeader *header;
@property (strong, nonatomic) UITapGestureRecognizer *tap;
@end
