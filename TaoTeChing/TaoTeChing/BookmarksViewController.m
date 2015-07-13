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

@interface BookmarksViewController ()

@end

@implementation BookmarksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationItem.title = @"Bookmarks";
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
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
    }
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
    return [BookmarkManager bookmarkManager].bookmarks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *bookmark = [NSString stringWithFormat:@"Chapter %@",[BookmarkManager bookmarkManager].bookmarks[indexPath.row]];
    cell.textLabel.font = [UIFont fontWithName:@"Avenir Next" size:18];
    
    NSString *previewText = [ModelController modelController].pageData[indexPath.row];
    previewText = [previewText substringToIndex: MIN(19, [previewText length])];
    bookmark = [NSString stringWithFormat:@"Chapter %@:   %@...",[BookmarkManager bookmarkManager].bookmarks[indexPath.row],previewText];
    cell.textLabel.text = bookmark.capitalizedString;

    
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
        [[BookmarkManager bookmarkManager]removeBookmark:[NSString stringWithFormat:@"%ld",indexPath.row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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
