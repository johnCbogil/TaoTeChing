//
//  BookmarksTableViewController.m
//  TaoTeChing
//
//  Created by John Bogil on 7/8/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import "BookmarksViewController.h"
#import "BookmarkManager.h"
#import "ModelController.h"
#import "PageViewController.h"

@interface BookmarksViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *zeroStateLabel;
@property (nonatomic) UIBarButtonItem *customEditButtonItem;
@property (nonatomic) int chapterNumber;
@end

@implementation BookmarksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationItem.title = @"Bookmarks";
    [self.navigationController.navigationBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"Avenir Next" size:21],
      NSFontAttributeName, nil]];
    
    self.zeroStateLabel.font = [UIFont fontWithName:@"Avenir Next" size:18];
}

- (void)viewDidAppear:(BOOL)animated{
    [self.tableView reloadData];
    if ([BookmarkManager bookmarkManager].bookmarks.count) {
        self.zeroStateLabel.alpha = 0.0;
        self.tableView.alpha = 1.0;
    }
    else{
        self.tableView.alpha = 0.0;
        self.zeroStateLabel.alpha = 1.0;
        
        self.navigationItem.rightBarButtonItem = nil;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBar.translucent = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    
    if ([BookmarkManager bookmarkManager].bookmarks.count == 0) {
        self.zeroStateLabel.alpha = 1.0;
    }
    
    return [BookmarkManager bookmarkManager].bookmarks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.font = [UIFont fontWithName:@"Avenir Next" size:18];
    NSInteger chapterNumber = [[NSString stringWithFormat:@"%@", [BookmarkManager bookmarkManager].bookmarks[indexPath.row]]integerValue];
    NSString *previewText = [ModelController modelController].pageData[chapterNumber];
    previewText = [previewText substringToIndex: MIN(19, [previewText length])];
    if (chapterNumber == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"About: %@", previewText];
    }
    else{
        cell.textLabel.text = [NSString stringWithFormat:@"Chapter %ld:   %@...",(long)chapterNumber,previewText].capitalizedString;
  
    }

    return cell;
}
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        NSLog(@"Removing page: %ld", indexPath.row);
       // [[BookmarkManager bookmarkManager]removeBookmark:indexPath.row]; //[NSString stringWithFormat:@"%ld",indexPath.row]];
        
        NSInteger chapterNumber = [[NSString stringWithFormat:@"%@", [BookmarkManager bookmarkManager].bookmarks[indexPath.row]]integerValue];
        
        [[BookmarkManager bookmarkManager]removeBookmark:chapterNumber onCompletion:^{
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Get the views.
    UIView * fromView = self.tabBarController.selectedViewController.view;
    UIView * toView = [[self.tabBarController.viewControllers objectAtIndex:1] view];
    
    // Get the size of the view area.
    CGRect viewSize = fromView.frame;
    BOOL scrollRight = 1 > self.tabBarController.selectedIndex;
    
    // Add the to view to the tab bar view.
    [fromView.superview addSubview:toView];
    
    // Position it off screen.
    toView.frame = CGRectMake((scrollRight ? 320 : -320), viewSize.origin.y, 320, viewSize.size.height);
    
    [UIView animateWithDuration:0.3
                     animations: ^{
                         
                         // Animate the views on and off the screen. This will appear to slide.
                         fromView.frame =CGRectMake((scrollRight ? -320 : 320), viewSize.origin.y, 320, viewSize.size.height);
                         toView.frame =CGRectMake(0, viewSize.origin.y, 320, viewSize.size.height);
                     }
     
                     completion:^(BOOL finished) {
                         if (finished) {
                             
                             // Remove the old view from the tabbar view.
                             [fromView removeFromSuperview];
                             self.tabBarController.selectedIndex = 1;
                             DataViewController *zeroVC = [[ModelController modelController] viewControllerAtIndex:[[BookmarkManager bookmarkManager].bookmarks[indexPath.row]integerValue] storyboard:self.storyboard];
                             NSArray *viewControllers = @[zeroVC];
                             
                             // Page direction depends on chapter number
                             
                             DataViewController *currentView = [[PageViewController pageViewController].pageViewController.viewControllers objectAtIndex:0];
                             NSInteger currentIndex = [[ModelController modelController] indexOfViewController:currentView];
                             if (indexPath.row > currentIndex) {

                             [[PageViewController pageViewController].pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
                             }
                             else{
                                 [[PageViewController pageViewController].pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
                                 
                             }
                         }
                     }];
}

//- (void) editButtonSelected: (id) sender
//{
//    if (self.tableView.editing) {
//        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButtonSelected:)];
//        [self.tableView setEditing:NO animated:YES];
//    } else {
//        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(editButtonSelected:)];
//        [self.tableView setEditing:YES animated:YES];
//    }
//}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
