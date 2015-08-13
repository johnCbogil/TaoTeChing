//
//  IndexTableViewController.m
//  TaoTeChing
//
//  Created by John Bogil on 7/14/15.
//  Copyright (c) 2015 John Bogil. All rights reserved.
//

#import "IndexTableViewController.h"
#import "ModelController.h"
#import "PageViewController.h"
#import "JumpToPageTableViewCell.h"

@interface IndexTableViewController () <JumpToPageTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@end

@implementation IndexTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"Index";
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"JumpToPageCell" owner:self options:nil];

    JumpToPageTableViewCell *cell = nib[0];
    cell.cellDelegate = self;
    self.tableView.tableHeaderView = cell;
    
}
- (IBAction)doneButtonPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
    return [ModelController modelController].pageData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    if (indexPath.row == 0) {
//        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"jumpToPageCell"];
//        [self.tableView registerNib:[UINib nibWithNibName:@"JumpToPageCell" bundle:nil ] forCellReuseIdentifier:@"jumpToPageCell"];
//
//        JumpToPageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jumpToPageCell" forIndexPath:indexPath];
//        cell.cellDelegate = self;
//        return cell;
//        
//    }
//    else {
    
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        
        NSString *previewText = [ModelController modelController].pageData[indexPath.row];
        NSInteger chapterNumber = (unsigned long)[[ModelController modelController].pageData indexOfObject:[ModelController modelController].pageData[indexPath.row]];
        previewText = [previewText substringToIndex: MIN(19, [previewText length])];
        cell.textLabel.font = [UIFont fontWithName:@"Avenir Next" size:18];
        if (chapterNumber == 0) {
            cell.textLabel.text = [NSString stringWithFormat:@"About: %@", previewText];
        }
        else{
            cell.textLabel.text = [NSString stringWithFormat:@"Chapter %lu:   %@... ",(long)chapterNumber, previewText];
        }
        return cell;
        
   // }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSInteger row = indexPath.row;
    
    [self jumpToChapter:row];
}

- (void)jumpToChapter:(NSInteger)row {
    
    [self dismissViewControllerAnimated:YES completion:^{
        DataViewController *zeroVC = [[ModelController modelController] viewControllerAtIndex:row storyboard:self.storyboard];
        NSArray *viewControllers = @[zeroVC];
        
        
        DataViewController *currentView = [[PageViewController pageViewController].pageViewController.viewControllers objectAtIndex:0];
        NSInteger currentIndex = [[ModelController modelController] indexOfViewController:currentView];
        if (row > currentIndex) {
            [[PageViewController pageViewController].pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
        }
        else{
            [[PageViewController pageViewController].pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
        }
    }];

    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

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
